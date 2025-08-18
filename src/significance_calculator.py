import os
import numpy as np
import pandas as pd
import ROOT
import uuid
from typing import Dict, List


def approx_global_sig(
    sig: np.array,
    bkg: np.array,
) -> float:
    w = np.log(1.0 + sig / (bkg + 1e-9))

    s_w = sig * w
    b_w = bkg * w
    s_ww = sig * w**2
    b_ww = bkg * w**2

    num = np.sum(s_w)
    den = np.sqrt(np.sum(s_ww + b_ww))

    return num / den


def process_data_to_histogram(
    data_dict: Dict[str, pd.DataFrame],
    bin_edges: List[float],
    query: str,
    observable: str,
    lumi: float,
    model: str = None,
    scale_factors: Dict[str, float] = None,
    is_signal: bool = False,
) -> ROOT.TH1F:
    # Create histogram with unique random name
    histogram_name = f"histo_{uuid.uuid4().hex[:8]}"
    n_bins = len(bin_edges) - 1
    histogram = ROOT.TH1F(histogram_name, histogram_name, n_bins, np.array(bin_edges))

    for channel_name, data in data_dict.items():
        # Apply selection query
        df = data.query(query)

        if len(df) == 0:
            continue

        # Calculate efficiency
        efficiency = len(df) / df["n_events_delphes"].iloc[0] if "n_events_delphes" in df.columns else 1.0

        # Calculate normalization factor
        if is_signal:
            # Get scale factor for this channel
            channel_key = f"{model}_{channel_name}"
            scale_factor = scale_factors.get(channel_key, 1.0)
            normalization_factor = scale_factor / len(df)
        else:
            normalization_factor = 1.0 / len(df)

        # Calculate weights
        weight = df["cross_section_delphes(pb)"] * lumi * efficiency * normalization_factor

        # Get observable values
        values = df[observable]

        # Fill histogram
        histogram.FillN(
            len(values),
            values.values,
            weight.values,
        )

    return histogram


def load_data_from_folder(folder_path: str) -> Dict[str, pd.DataFrame]:
    """Helper function to load feather files from a folder."""
    if not os.path.exists(folder_path):
        return {}

    data_dict = {}
    files = [f for f in os.listdir(folder_path) if f.endswith(".feather")]

    for file in files:
        key = file.replace(".feather", "")
        file_path = os.path.join(folder_path, file)
        data_dict[key] = pd.read_feather(file_path)

    return data_dict


def calculate_approx_global_significance(
    signals: Dict[str, pd.DataFrame],
    backgrounds: Dict[str, pd.DataFrame],
    model: str,
    scale_factors: Dict[str, float],
    observable: str,
    bin_edges: List[float],
    queries: List[str],
    lumi: float = 35000,  # pb-1
) -> float:
    assert type(queries) is list, "Queries should be a list of strings."
    sig = []
    bkg = []
    for query in queries:
        # Process backgrounds
        histo_bkgs = process_data_to_histogram(
            backgrounds,
            bin_edges,
            query,
            observable,
            lumi,
            is_signal=False,
        )

        # Process signals
        histo_signals = process_data_to_histogram(
            signals,
            bin_edges,
            query,
            observable,
            lumi,
            model,
            scale_factors,
            is_signal=True,
        )

        # Extract bin contents
        sig += [histo_signals.GetBinContent(i) for i in range(1, histo_signals.GetNbinsX() + 1)]

        bkg += [histo_bkgs.GetBinContent(i) for i in range(1, histo_bkgs.GetNbinsX() + 1)]

    # Calculate approximate global significance
    significance = approx_global_sig(np.array(sig), np.array(bkg))

    return significance
