"""
BRT Predictor class for DiTaus mass prediction.

This module contains the main BRTPredictor class that loads trained models
and provides prediction functionality.
"""

import os
import joblib
import numpy as np
import pandas as pd
from typing import Optional, Dict
import warnings

from .features import create_advanced_features, BASIC_FEATURES, DECAY_TYPES


class BRTPredictor:
    """
    Boosted Regression Tree predictor for DiTau mass estimation.

    This class loads pre-trained XGBoost models for different tau decay modes
    and provides prediction functionality with proper feature engineering.
    """

    def __init__(self, models_dir: Optional[str] = None):
        """
        Initialize the BRT predictor.

        Parameters:
        -----------
        models_dir : str, optional
            Path to directory containing trained model files.
            If None, uses the default models directory in the package.
        """
        if models_dir is None:
            # Use default models directory in package
            package_dir = os.path.dirname(__file__)
            models_dir = os.path.join(package_dir, "models")

        self.models_dir = models_dir
        self.models = {}
        self.decay_types = DECAY_TYPES.copy()

        # Load all available models
        self._load_models()

    def _load_models(self):
        """Load all trained XGBoost models from the models directory."""
        loaded_models = []
        missing_models = []

        for decay_type in self.decay_types:
            model_path = os.path.join(self.models_dir, f"xgb_model_{decay_type}.pkl")

            if os.path.exists(model_path):
                try:
                    self.models[decay_type] = joblib.load(model_path)
                    loaded_models.append(decay_type)
                except Exception as e:
                    warnings.warn(f"Error loading model for {decay_type}: {str(e)}")
                    missing_models.append(decay_type)
            else:
                missing_models.append(decay_type)

        if missing_models:
            warnings.warn(f"Missing models for decay types: {missing_models}")

        print(f"Loaded {len(loaded_models)} BRT models: {loaded_models}")

    def predict(self, df: pd.DataFrame) -> pd.Series:
        """
        Predict DiTau mass for a DataFrame of events.

        Parameters:
        -----------
        df : pd.DataFrame
            DataFrame containing kinematic features and 'decay_mode' column.
            Must contain all features in BASIC_FEATURES.

        Returns:
        --------
        pd.Series
            Series with BRT mass predictions, indexed by df.index.
            NaN values for decay modes without available models.
        """
        # Validate input features
        missing_features = set(BASIC_FEATURES) - set(df.columns)
        if missing_features:
            raise ValueError(f"Missing required features: {missing_features}")

        if "decay_mode" not in df.columns:
            raise ValueError("DataFrame must contain 'decay_mode' column")

        # Initialize predictions series
        predictions = pd.Series(index=df.index, dtype=float, name="BRT_mass")
        missing_modes = set()

        # Group by decay_mode for efficient prediction
        for decay_mode, group_indices in df.groupby("decay_mode").groups.items():
            if decay_mode in self.models:
                # Create enhanced features for this group
                group_data = df.loc[group_indices, BASIC_FEATURES]
                X_enhanced = create_advanced_features(group_data)

                # Predict using the appropriate model
                predictions.loc[group_indices] = self.models[decay_mode].predict(X_enhanced)
            else:
                missing_modes.add(decay_mode)
                predictions.loc[group_indices] = np.nan

        if missing_modes:
            warnings.warn(f"No models available for decay_mode = {sorted(missing_modes)}. Assigned NaN.")

        return predictions

    def predict_single_event(
        self,
        pt_vis1: float,
        eta_vis1: float,
        energy_vis1: float,
        pt_vis2: float,
        eta_vis2: float,
        energy_vis2: float,
        met: float,
        dphi_vis_1_2: float,
        dphi_vis_1_met: float,
        dphi_vis_2_met: float,
        deta_vis_1_2: float,
        dr_vis_met: float,
        decay_mode: str,
    ) -> float:
        """
        Predict mass for a single event with individual feature values.

        Parameters:
        -----------
        pt_vis1, eta_vis1, energy_vis1 : float
            Leading tau kinematic variables
        pt_vis2, eta_vis2, energy_vis2 : float
            Subleading tau kinematic variables
        met : float
            Missing transverse energy
        dphi_vis_1_2, dphi_vis_1_met, dphi_vis_2_met : float
            Delta phi angles
        deta_vis_1_2, dr_vis_met : float
            Delta eta and delta R variables
        decay_mode : str
            Tau decay mode (e.g., "1_prong_1_prong", "1_prong_leptonic", etc.)

        Returns:
        --------
        float
            Predicted BRT mass, or NaN if model not available
        """
        # Create single-row DataFrame
        event_data = pd.DataFrame(
            {
                "Pt_vis1": [pt_vis1],
                "Eta_vis1": [eta_vis1],
                "Energy_vis1": [energy_vis1],
                "Pt_vis2": [pt_vis2],
                "Eta_vis2": [eta_vis2],
                "Energy_vis2": [energy_vis2],
                "MET": [met],
                "dPhi_vis_1_2": [dphi_vis_1_2],
                "dPhi_vis_1_MET": [dphi_vis_1_met],
                "dPhi_vis_2_MET": [dphi_vis_2_met],
                "dEta_vis_1_2": [deta_vis_1_2],
                "dR_vis_MET": [dr_vis_met],
                "decay_mode": [decay_mode],
            }
        )

        prediction = self.predict(event_data)
        return prediction.iloc[0]

    def get_available_models(self) -> list:
        """Return list of decay types with loaded models."""
        return list(self.models.keys())

    def get_feature_names(self) -> list:
        """Return list of required input features."""
        return BASIC_FEATURES.copy()

    def __repr__(self):
        return f"BRTPredictor(models_loaded={len(self.models)}, decay_types={list(self.models.keys())})"
