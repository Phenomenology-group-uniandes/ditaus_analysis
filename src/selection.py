

import lhe_tools as lt 
import pandas as pd
from ROOT import TLorentzVector, TMath, TH1F, TCanvas
import gzip
import xml.etree.ElementTree as ET
import numpy as np
from tqdm import tqdm
import ROOT
import csv
import os
import sys
from multiprocessing import Pool
import math

ROOT.gSystem.Load("libDelphes")

try:
    ROOT.gInterpreter.Declare('#include "classes/DelphesClasses.h"')
    ROOT.gInterpreter.Declare('#include "ExRootAnalysis/ExRootTreeReader.h"')
except:
    pass

# --- Counter initializer (used to avoid shared mutable state) ---
def init_counters():
    return {
        "counter_total": 0,
        "counter_electron": 0,
        "counter_muon": 0,
        "counter_bjet": 0,
        "counter_taus": 0,
        "counter_Pt": 0,
        "counter_eta": 0,
        "counter_deltaR": 0
    }

# --- Per-file processor ---
def process_file(file):
    rows = []
    counters = init_counters()

    chain = ROOT.TChain("Delphes")
    chain.Add(file)
    treeReader = ROOT.ExRootTreeReader(chain)
    numberOfEntries = treeReader.GetEntries()

    branchJet = treeReader.UseBranch("Jet")
    branchParticle = treeReader.UseBranch("Particle")
    branchElectron = treeReader.UseBranch("Electron")
    branchPhoton = treeReader.UseBranch("Photon")
    branchMuon = treeReader.UseBranch("Muon")
    branchTrack = treeReader.UseBranch("Track")
    branchMissingET = treeReader.UseBranch("MissingET")
    branchEFlowTrack = treeReader.UseBranch("EFlowTrack")
    branchEFlowPhoton = treeReader.UseBranch("EFlowPhoton")
    branchEFlowNeutralHadron = treeReader.UseBranch("EFlowNeutralHadron")

    for entry in range(0, numberOfEntries):
        counters["counter_total"] += 1
        treeReader.ReadEntry(entry)

        if branchElectron.GetEntriesFast() != 0:
            continue
        counters["counter_electron"] += 1

        if branchMuon.GetEntriesFast() != 0:
            continue
        counters["counter_muon"] += 1

        n_b_jets = 0
        tau_pos_box = []
        tau_neg_box = []

        for i in range(branchJet.GetEntriesFast()):
            jet = branchJet.At(i)
            n_b_jets += jet.BTag

            if jet.TauTag > 0:

                tracks = ROOT.TLorentzVector()
                towers = ROOT.TLorentzVector()

                for j in range(0, jet.Constituents.GetEntriesFast()):
                    obj = jet.Constituents.At(j)
                    if obj.Class_Name() == "Track":
                        tracks += obj.P4()
                    elif obj.Class_Name() == "Tower":
                        towers += obj.P4()

                tracks_energy = tracks.E()
            
                vis_energy = tracks.E() + towers.E()

                if vis_energy!=0:
                    charged_energy_asymmetry= -1 + (2*tracks_energy)/vis_energy
                else:
                    charged_energy_asymmetry= 0

                if jet.Charge > 0:
                    tau_pos_box.append((jet, jet.NCharged,jet.NNeutrals,charged_energy_asymmetry))
                else:
                    tau_neg_box.append((jet, jet.NCharged,jet.NNeutrals,charged_energy_asymmetry))


        if n_b_jets != 0:
            continue
        counters["counter_bjet"] += 1

        if len(tau_pos_box) != 1 or len(tau_neg_box) != 1:
            continue
        counters["counter_taus"] += 1

        tau_pos = TLorentzVector()
        tau_neg = TLorentzVector()
        tau_pos_Ncharged = tau_pos_box[0][1]
        tau_neg_Ncharged = tau_neg_box[0][1]
        tau_pos_NNeutrals = tau_pos_box[0][2]
        tau_neg_NNeutrals = tau_neg_box[0][2]

        charged_energy_asymmetry=tau_pos_box[0][3]

        tau_pos.SetPtEtaPhiM(tau_pos_box[0][0].PT, tau_pos_box[0][0].Eta, tau_pos_box[0][0].Phi, 1.7)
        tau_neg.SetPtEtaPhiM(tau_neg_box[0][0].PT, tau_neg_box[0][0].Eta, tau_neg_box[0][0].Phi, 1.7)

        if tau_pos.Pt() < 30 or tau_neg.Pt() < 30:
            continue
        counters["counter_Pt"] += 1

        if abs(tau_pos.Eta()) > 2.3 or abs(tau_neg.Eta()) > 2.3:
            continue
        counters["counter_eta"] += 1

        delta_r = tau_pos.DeltaR(tau_neg)
        if delta_r < 0.3:
            continue
        counters["counter_deltaR"] += 1


        met_ = branchMissingET.At(0)

        met_ = branchMissingET.At(0)
        met_px = met_.MET * math.cos(met_.Phi)
        met_py = met_.MET * math.sin(met_.Phi)

        tau_pos_3d = ROOT.TVector3(tau_pos.Px(), tau_pos.Py(), tau_pos.Pz())
        tau_neg_3d = ROOT.TVector3(tau_neg.Px(), tau_neg.Py(), tau_neg.Pz())
        MET_3d = ROOT.TVector3(met_px, met_py, 0)

        suma = tau_pos_3d + tau_neg_3d + MET_3d
        magnitude = suma.Mag()

        row = {
            "Pt_tau_pos": tau_pos.Pt(),
            "Eta_tau_pos": tau_pos.Eta(),
            "Phi_tau_pos": tau_pos.Phi(),
            "Pt_tau_neg": tau_neg.Pt(),
            "Eta_tau_neg": tau_neg.Eta(),
            "Phi_tau_neg": tau_neg.Phi(),
            "Masa_visible": (tau_pos + tau_neg).M(),
            "Masa_reco": (((tau_pos.E() + tau_neg.E()+met_.MET)**2-(magnitude)**2)**(0.5)),
            "MET_Eta": met_.Eta,
            "MET_Phi": met_.Phi,
            "MET": met_.MET,
            "dPhi_vis_1_2": tau_pos.DeltaPhi(tau_neg),
            "dPhi_vis_1_MET": abs(tau_pos.Phi() - met_.Phi),
            "dPhi_vis_2_MET": abs(tau_neg.Phi() - met_.Phi),
            "dEta_vis_1_2": abs(tau_pos.Eta() - tau_neg.Eta()),
            "dR_vis_MET": ((abs((tau_pos + tau_neg).Phi() - met_.Phi)) ** 2 + (abs((tau_pos + tau_neg).Eta() - met_.Eta)) ** 2) ** 0.5,
            "NCharged_tau_pos": tau_pos_Ncharged,
            "NCharged_tau_neg": tau_neg_Ncharged,
            "NNeutrals_tau_pos": tau_pos_NNeutrals,
            "NNeutrals_tau_neg": tau_neg_NNeutrals,
            "charged_energy_asymmetry":charged_energy_asymmetry
     
        }

        rows.append(row)

    return rows, counters

# --- Parallel Delphes reader ---
def get_df_delphes(forest, n_workers=10):
    with Pool(n_workers) as pool:
        results = list(tqdm(pool.imap(process_file, forest), total=len(forest)))

    all_rows = []
    all_counters = []

    for rows, counters in results:
        all_rows.extend(rows)
        all_counters.append(counters)

    # Aggregate all counters
    total_counters = {key: sum(d[key] for d in all_counters) for key in all_counters[0]}
    return pd.DataFrame.from_records(all_rows), total_counters



