import os
import re

import pandas as pd
import ROOT
from tqdm.auto import tqdm

ROOT.gSystem.Load("libDelphes")

try:
    ROOT.gInterpreter.Declare('#include "classes/DelphesClasses.h"')
    ROOT.gInterpreter.Declare('#include "ExRootAnalysis/ExRootTreeReader.h"')
except:
    pass

CUTS = {
    "light": {"pt_min_cut": 30.0, "eta_min_cut": -5.0, "eta_max_cut": +5.0},
    "b": {"pt_min_cut": 30.0, "eta_min_cut": -2.4, "eta_max_cut": +2.4},
    "tau": {"pt_min_cut": 10.0, "eta_min_cut": -2.3, "eta_max_cut": +2.3},
    "Electron": {"pt_min_cut": 30.0, "eta_min_cut": -2.4, "eta_max_cut": +2.4},
    "Muon": {"pt_min_cut": 30.0, "eta_min_cut": -2.4, "eta_max_cut": +2.4},
}


class TauCandidate:
    def __init__(self, ref, is_hadronic=True):
        self.Ref = ref

        self.type = "had" if is_hadronic else "lep"
        self.Charge = ref.Charge
        self.is_hadronic = is_hadronic
        class_name = ref.__class__.__name__
        if class_name == "Muon":
            self.Mass = 0.105658  # GeV
        elif class_name == "Electron":
            self.Mass = 0.000511  # GeV
        else:
            self.Mass = ref.Mass  # GeV
        if is_hadronic:
            self.NCharged = ref.NCharged
            self.NNeutrals = ref.NNeutrals
            self.ChargedEnergyFraction = ref.ChargedEnergyFraction
            self.NeutralEnergyFraction = ref.NeutralEnergyFraction
            self.TauWeight = ref.TauWeight

        else:
            self.NCharged = 1
            self.NNeutrals = 0
            self.ChargedEnergyFraction = 1.0
            self.NeutralEnergyFraction = 0.0
            self.TauWeight = 1.0

    def P4(self):
        return self.Ref.P4()

    @property
    def PT(self):
        return self.Ref.PT

    @property
    def Eta(self):
        return self.Ref.Eta

    @property
    def Phi(self):
        return self.Ref.Phi


def jet_type(jet):
    if jet.BTag == 0 and jet.TauTag == 1:
        return "tau"
    elif jet.BTag == 1 and jet.TauTag == 0:
        return "b"
    elif jet.BTag == 0 and jet.TauTag == 0:
        return "light"
    else:
        return "other_jet"


def pass_kinematic(obj: object, cuts: dict[str, float]) -> bool:
    pt = obj.PT
    eta = obj.Eta
    return pt > cuts["pt_min_cut"] and cuts["eta_min_cut"] <= eta <= cuts["eta_max_cut"]


def fill_object_info(
    row: dict[str, float], obj: object, prefix: str, extra_attrs: list[str] = []  # delphes object
) -> dict[str, float]:
    row[f"{prefix}_pt"] = obj.PT
    row[f"{prefix}_eta"] = obj.Eta
    row[f"{prefix}_phi"] = obj.Phi
    row[f"{prefix}_mass"] = obj.Mass

    for attr in extra_attrs:
        row[f"{prefix}_{attr}"] = getattr(obj, attr)

    return row


def get_cross_section_pb(log_text):
    """
    Given the text of a Pythia log, extract the cross section and its error in pb.
    Returns (cross_section_pb, error_pb) as floats, or (None, None) if not found.
    """
    # Regex to match the line
    pattern = r"Inclusive cross section:\s*([0-9.eE+-]+)\s*\+\-\s*([0-9.eE+-]+)\s*mb"
    for line in log_text.splitlines():
        match = re.search(pattern, line)
        if match:
            value_mb = float(match.group(1))
            error_mb = float(match.group(2))
            # Convert mb to pb
            value_pb = value_mb * 1e9
            error_pb = error_mb * 1e9
            return value_pb, error_pb
    return None, None


def run_preselection(root_file_path: str) -> pd.DataFrame:
    print("=" * 80)
    print("=" * 80)
    print("=" * 80)
    print(f"Running preselection on")
    print(root_file_path)
    results = dict()

    good_jets_idx = {"light": [], "b": [], "tau": []}
    print("Loading ROOT file and initializing tree reader...")
    tfile = ROOT.TFile(root_file_path)
    tree = tfile.Get("Delphes")
    treeReader = ROOT.ExRootTreeReader(tree)
    numberOfEntries = treeReader.GetEntries()
    print(f"Number of entries in the tree: {numberOfEntries}")
    # Load the required branches
    delphes_branches = [
        "Jet",
        "Particle",
        "Electron",
        "Photon",
        "Muon",
        # "Track",
        "MissingET",
        # "EFlowTrack",
        # "EFlowPhoton",
        # "EFlowNeutralHadron",
        "ScalarHT",
    ]
    branches = {branch: treeReader.UseBranch(branch) for branch in delphes_branches}
    pythia_log_file = root_file_path.replace("delphes_events.root", "pythia8.log")
    xs = get_cross_section_pb(
        open(pythia_log_file, "r").read() if os.path.exists(pythia_log_file) else None
    )[0]

    mg5_run_name = os.path.basename(os.path.dirname(root_file_path))
    for entry in tqdm(range(0, numberOfEntries), desc="Processing entries"):
        row = {"cross_section_delphes(pb)": xs, "n_events_delphes": numberOfEntries}
        treeReader.ReadEntry(entry)

        n_raw_jets = branches["Jet"].GetEntriesFast()
        n_raw_Electrons = branches["Electron"].GetEntriesFast()
        n_raw_Muons = branches["Muon"].GetEntriesFast()

        good_jets_idx = {"light": list(), "b": list(), "tau": list()}

        for jet_idx in range(n_raw_jets):
            jet = branches["Jet"].At(jet_idx)
            jtype = jet_type(jet)
            if jtype in good_jets_idx and pass_kinematic(jet, CUTS[jtype]):
                good_jets_idx[jtype].append(jet_idx)

        good_jets = {
            "light": [branches["Jet"].At(idx) for idx in good_jets_idx["light"]],
            "b": [branches["Jet"].At(idx) for idx in good_jets_idx["b"]],
            "tau": [branches["Jet"].At(idx) for idx in good_jets_idx["tau"]],
        }

        good_leptons = {
            "Electron": [
                branches["Electron"].At(i)
                for i in range(n_raw_Electrons)
                if pass_kinematic(branches["Electron"].At(i), CUTS["Electron"])
            ],
            "Muon": [
                branches["Muon"].At(i)
                for i in range(n_raw_Muons)
                if pass_kinematic(branches["Muon"].At(i), CUTS["Muon"])
            ],
        }

        n_light_jets = len(good_jets["light"])

        tau_candidates = good_jets["tau"] + good_leptons["Electron"] + good_leptons["Muon"]
        tau_candidates = [TauCandidate(tau, tau in good_jets["tau"]) for tau in tau_candidates]

        # exactly two tau candidates
        if len(tau_candidates) != 2:
            continue
        # ensure that are oposite charge
        if not (tau_candidates[0].Charge * tau_candidates[1].Charge < 0):
            continue
        # sort by charge
        tau_candidates.sort(key=lambda x: x.Charge)

        label = "ditau"
        tau_extra_attrs = [
            "TauWeight",
            "Charge",
            "type",
            "NCharged",
            "NNeutrals",
            "ChargedEnergyFraction",
            "NeutralEnergyFraction",
        ]
        fill_object_info(
            row,
            tau_candidates[0],
            "tau_-",
            tau_extra_attrs,
        )
        fill_object_info(
            row,
            tau_candidates[1],
            "tau_+",
            tau_extra_attrs,
        )

        row["n_light_jets"] = n_light_jets
        row["HT"] = branches["ScalarHT"].At(0).HT
        row["met_pt"] = branches["MissingET"].At(0).MET
        row["met_phi"] = branches["MissingET"].At(0).Phi

        # Classify the event by number of b-jets
        n_bs = len(good_jets["b"])
        if n_bs == 0:
            label += "_no_bjets"
        else:
            fill_object_info(row, good_jets["b"][0], "lead_bjet")
            if n_bs > 1:
                label += "_at_least_two_bjets"
                fill_object_info(row, good_jets["b"][1], "sublead_bjet")
            else:
                label += "_exactly_one_bjet"
        row["label"] = label
        # select or create by label
        results[label] = results.get(label, []) + [row]
    results = {label: pd.DataFrame.from_records(results[label]) for label in results}
    concated_results = pd.concat(results.values(), ignore_index=True)
    concated_results["n_events_preselected"] = len(concated_results)
    concated_results["mg5_run_name"] = mg5_run_name
    feather_path = root_file_path.replace(".root", "_ditaus.feather")
    concated_results.to_feather(feather_path)
    # Clean up
    tfile.Close()

    # Return the concatenated DataFrame
    return concated_results
