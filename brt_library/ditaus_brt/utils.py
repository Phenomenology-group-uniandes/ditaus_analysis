"""
Utility functions for the DiTaus BRT Library.

This module contains helper functions for converting ROOT TLorentz vectors
and other common data formats into the format expected by the BRT predictor.
"""

import numpy as np
import pandas as pd
from typing import Union, Optional


def create_feature_row_from_tlorentz(
    lead_tau, sublead_tau, met, decay_mode_lead: str, decay_mode_sublead: str
) -> dict:
    """
    Create a feature row from ROOT TLorentz vectors and decay modes.

    This function takes TLorentz vectors for the leading tau, subleading tau,
    and missing energy, along with decay mode information, and creates a
    dictionary with all the features needed for BRT prediction.

    Parameters:
    -----------
    lead_tau : ROOT.TLorentzVector
        TLorentz vector of the leading tau
    sublead_tau : ROOT.TLorentzVector
        TLorentz vector of the subleading tau
    met : ROOT.TLorentzVector
        TLorentz vector of the missing energy
    decay_mode_lead : str
        Decay mode of the leading tau ("1_prong", "3_prong", or "leptonic")
    decay_mode_sublead : str
        Decay mode of the subleading tau ("1_prong", "3_prong", or "leptonic")

    Returns:
    --------
    dict
        Dictionary containing all features needed for BRT prediction:
        - Basic kinematic variables
        - Angular variables
        - Derived quantities
        - Combined decay mode
    """

    # Determine combined decay mode
    if decay_mode_lead == decay_mode_sublead:
        decay_mode = f"{decay_mode_lead}_{decay_mode_sublead}"
    elif (decay_mode_lead, decay_mode_sublead) in [("1_prong", "3_prong"), ("3_prong", "1_prong")]:
        decay_mode = "1_prong_3_prong"
    elif (decay_mode_lead, decay_mode_sublead) in [("leptonic", "1_prong"), ("1_prong", "leptonic")]:
        decay_mode = "1_prong_leptonic"
    elif (decay_mode_lead, decay_mode_sublead) in [("leptonic", "3_prong"), ("3_prong", "leptonic")]:
        decay_mode = "leptonic_3_prong"
    else:
        # Default fallback - should be handled by caller
        decay_mode = f"{decay_mode_lead}_{decay_mode_sublead}"

    # Calculate derived quantities
    reco_mass = (lead_tau + sublead_tau + met).M()
    visible_mass = (lead_tau + sublead_tau).M()
    st_met = lead_tau.Pt() + sublead_tau.Pt() + met.Pt()

    # Create feature row
    row = {
        # Basic kinematic features
        "Pt_vis1": lead_tau.Pt(),
        "Eta_vis1": lead_tau.Eta(),
        "Phi_vis1": lead_tau.Phi(),
        "Energy_vis1": lead_tau.E(),
        "Pt_vis2": sublead_tau.Pt(),
        "Eta_vis2": sublead_tau.Eta(),
        "Phi_vis2": sublead_tau.Phi(),
        "Energy_vis2": sublead_tau.E(),
        "MET": met.Pt(),
        "MET_Phi": met.Phi(),
        # Angular variables
        "dPhi_vis_1_2": lead_tau.DeltaPhi(sublead_tau),
        "dPhi_vis_1_MET": lead_tau.DeltaPhi(met),
        "dPhi_vis_2_MET": sublead_tau.DeltaPhi(met),
        "dEta_vis_1_2": abs(lead_tau.Eta() - sublead_tau.Eta()),
        "dR_vis_MET": (lead_tau + sublead_tau).DeltaR(met),
        # Derived quantities
        "reco_mass": reco_mass,
        "visible_mass": visible_mass,
        "ST_MET": st_met,
        # Decay mode information
        "decay_mode": decay_mode,
        "decay_mode_lead": decay_mode_lead,
        "decay_mode_sublead": decay_mode_sublead,
    }

    return row


def create_dataframe_from_tlorentz_list(
    lead_taus: list, sublead_taus: list, mets: list, decay_modes_lead: list, decay_modes_sublead: list
) -> pd.DataFrame:
    """
    Create a pandas DataFrame from lists of TLorentz vectors and decay modes.

    This function is useful for batch processing multiple events.

    Parameters:
    -----------
    lead_taus : list
        List of TLorentz vectors for leading taus
    sublead_taus : list
        List of TLorentz vectors for subleading taus
    mets : list
        List of TLorentz vectors for missing energy
    decay_modes_lead : list
        List of decay modes for leading taus
    decay_modes_sublead : list
        List of decay modes for subleading taus

    Returns:
    --------
    pd.DataFrame
        DataFrame ready for BRT prediction
    """

    # Validate input lengths
    lengths = [len(lead_taus), len(sublead_taus), len(mets), len(decay_modes_lead), len(decay_modes_sublead)]
    if not all(l == lengths[0] for l in lengths):
        raise ValueError("All input lists must have the same length")

    # Create rows
    rows = []
    for i in range(len(lead_taus)):
        row = create_feature_row_from_tlorentz(
            lead_taus[i], sublead_taus[i], mets[i], decay_modes_lead[i], decay_modes_sublead[i]
        )
        rows.append(row)

    return pd.DataFrame(rows)


def predict_from_tlorentz(
    predictor, lead_tau, sublead_tau, met, decay_mode_lead: str, decay_mode_sublead: str
) -> float:
    """
    Convenience function to predict mass directly from TLorentz vectors.

    Parameters:
    -----------
    predictor : BRTPredictor
        Initialized BRT predictor instance
    lead_tau : ROOT.TLorentzVector
        TLorentz vector of the leading tau
    sublead_tau : ROOT.TLorentzVector
        TLorentz vector of the subleading tau
    met : ROOT.TLorentzVector
        TLorentz vector of the missing energy
    decay_mode_lead : str
        Decay mode of the leading tau
    decay_mode_sublead : str
        Decay mode of the subleading tau

    Returns:
    --------
    float
        Predicted BRT mass
    """

    # Create feature row
    row = create_feature_row_from_tlorentz(lead_tau, sublead_tau, met, decay_mode_lead, decay_mode_sublead)

    # Convert to DataFrame
    df = pd.DataFrame([row])

    # Get prediction
    prediction = predictor.predict(df)

    return prediction.iloc[0]
