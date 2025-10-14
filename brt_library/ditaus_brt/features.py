"""
Feature engineering functions for DiTaus BRT models.

This module contains functions to create advanced features from basic kinematic variables
for use with the trained BRT models.
"""

import numpy as np
import pandas as pd


def create_advanced_features(df: pd.DataFrame) -> pd.DataFrame:
    """
    Create advanced features from basic kinematic variables.

    This function must replicate exactly the features used during training.

    Parameters:
    -----------
    df : pd.DataFrame
        DataFrame containing the basic features:
        - Pt_vis1, Eta_vis1, Energy_vis1
        - Pt_vis2, Eta_vis2, Energy_vis2
        - MET
        - dPhi_vis_1_2, dPhi_vis_1_MET, dPhi_vis_2_MET
        - dEta_vis_1_2, dR_vis_MET

    Returns:
    --------
    pd.DataFrame
        Enhanced DataFrame with additional engineered features
    """
    df_enhanced = df.copy()

    # Angular features (trigonometric)
    df_enhanced["cos_dPhi_vis_1_2"] = np.cos(df["dPhi_vis_1_2"])
    df_enhanced["sin_dPhi_vis_1_2"] = np.sin(df["dPhi_vis_1_2"])
    df_enhanced["cos_dPhi_vis_1_MET"] = np.cos(df["dPhi_vis_1_MET"])
    df_enhanced["sin_dPhi_vis_1_MET"] = np.sin(df["dPhi_vis_1_MET"])
    df_enhanced["cos_dPhi_vis_2_MET"] = np.cos(df["dPhi_vis_2_MET"])
    df_enhanced["sin_dPhi_vis_2_MET"] = np.sin(df["dPhi_vis_2_MET"])

    # Energy and momentum ratios
    df_enhanced["E_ratio"] = df["Energy_vis1"] / (df["Energy_vis2"] + 1e-8)
    df_enhanced["Pt_ratio"] = df["Pt_vis1"] / (df["Pt_vis2"] + 1e-8)

    # MET projections
    df_enhanced["MET_parallel"] = df["MET"] * np.cos(df["dPhi_vis_1_MET"])
    df_enhanced["MET_perpendicular"] = df["MET"] * np.sin(df["dPhi_vis_1_MET"])

    # Momentum imbalance
    df_enhanced["Pt_imbalance"] = abs(df["Pt_vis1"] - df["Pt_vis2"]) / (df["Pt_vis1"] + df["Pt_vis2"] + 1e-8)

    return df_enhanced


# List of basic features expected by the models (must match training)
BASIC_FEATURES = [
    "Pt_vis1",
    "Eta_vis1",
    "Energy_vis1",  # 'Phi_vis1' excluded
    "Pt_vis2",
    "Eta_vis2",
    "Energy_vis2",  # 'Phi_vis2' excluded
    "MET",  # 'MET_Phi' excluded
    "dPhi_vis_1_2",
    "dPhi_vis_1_MET",
    "dPhi_vis_2_MET",
    "dEta_vis_1_2",
    "dR_vis_MET",
    # "reco_mass" excluded as target variable
]

# Supported decay types
DECAY_TYPES = [
    "1_prong_1_prong",
    "1_prong_3_prong",
    "1_prong_leptonic",
    "3_prong_3_prong",
    "leptonic_3_prong",
    "leptonic_leptonic",
]
