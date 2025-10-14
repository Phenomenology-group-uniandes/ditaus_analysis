"""
DiTaus BRT Library
==================

A library for predicting ditau mass using Boosted Regression Trees (BRT).
This library contains pre-trained XGBoost models for different tau decay modes.

Author: Phenomenology Group - Universidad de los Andes
"""

from .predictor import BRTPredictor
from .features import create_advanced_features
from .utils import create_feature_row_from_tlorentz, create_dataframe_from_tlorentz_list, predict_from_tlorentz

__version__ = "1.0.0"
__all__ = [
    "BRTPredictor",
    "create_advanced_features",
    "create_feature_row_from_tlorentz",
    "create_dataframe_from_tlorentz_list",
    "predict_from_tlorentz",
]
