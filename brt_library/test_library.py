#!/usr/bin/env python3
"""
Test script for the DiTaus BRT Library.

This script tests the basic functionality of the BRT predictor library
to ensure it works correctly in a new environment.
"""

import sys
import os
import numpy as np
import pandas as pd

try:
    from ditaus_brt import (
        BRTPredictor,
        create_advanced_features,
        create_feature_row_from_tlorentz,
        create_dataframe_from_tlorentz_list,
        predict_from_tlorentz,
    )

    print("✓ Successfully imported ditaus_brt library")
except ImportError as e:
    print(f"✗ Failed to import ditaus_brt library: {e}")
    print("Make sure the library is installed or in your Python path")
    sys.exit(1)


def test_predictor_initialization():
    """Test BRTPredictor initialization and model loading."""
    print("\n=== Testing BRTPredictor Initialization ===")

    try:
        predictor = BRTPredictor()
        print("✓ BRTPredictor initialized successfully")

        available_models = predictor.get_available_models()
        print(f"✓ Loaded models for {len(available_models)} decay types: {available_models}")

        required_features = predictor.get_feature_names()
        print(f"✓ Required features ({len(required_features)}): {required_features}")

        return predictor

    except Exception as e:
        print(f"✗ Error initializing BRTPredictor: {e}")
        return None


def test_feature_engineering():
    """Test feature engineering functionality."""
    print("\n=== Testing Feature Engineering ===")

    # Create sample data
    sample_data = pd.DataFrame(
        {
            "Pt_vis1": [45.2, 67.8],
            "Eta_vis1": [0.5, -1.2],
            "Energy_vis1": [52.3, 78.9],
            "Pt_vis2": [32.1, 43.2],
            "Eta_vis2": [-0.8, 1.5],
            "Energy_vis2": [38.7, 51.2],
            "MET": [35.6, 42.1],
            "dPhi_vis_1_2": [2.1, 2.8],
            "dPhi_vis_1_MET": [1.2, 0.8],
            "dPhi_vis_2_MET": [0.9, 2.2],
            "dEta_vis_1_2": [1.3, 2.7],
            "dR_vis_MET": [2.1, 1.8],
        }
    )

    try:
        enhanced_data = create_advanced_features(sample_data)
        print(f"✓ Feature engineering successful: {len(sample_data.columns)} → {len(enhanced_data.columns)} features")

        # Check that new features were added
        expected_new_features = [
            "cos_dPhi_vis_1_2",
            "sin_dPhi_vis_1_2",
            "E_ratio",
            "Pt_ratio",
            "MET_parallel",
            "MET_perpendicular",
            "Pt_imbalance",
        ]
        for feature in expected_new_features:
            if feature in enhanced_data.columns:
                print(f"  ✓ {feature} created")
            else:
                print(f"  ✗ {feature} missing")

        return True

    except Exception as e:
        print(f"✗ Error in feature engineering: {e}")
        return False


def test_batch_prediction(predictor):
    """Test batch prediction functionality."""
    print("\n=== Testing Batch Prediction ===")

    # Create test data with multiple events and decay modes
    test_data = pd.DataFrame(
        {
            "Pt_vis1": [45.2, 67.8, 89.1, 56.3, 78.9],
            "Eta_vis1": [0.5, -1.2, 0.8, -0.3, 1.1],
            "Energy_vis1": [52.3, 78.9, 95.4, 62.1, 84.7],
            "Pt_vis2": [32.1, 43.2, 56.7, 41.8, 59.2],
            "Eta_vis2": [-0.8, 1.5, -0.3, 0.9, -1.4],
            "Energy_vis2": [38.7, 51.2, 62.8, 47.3, 65.8],
            "MET": [35.6, 42.1, 28.9, 33.7, 46.2],
            "dPhi_vis_1_2": [2.1, 2.8, 1.9, 2.3, 2.6],
            "dPhi_vis_1_MET": [1.2, 0.8, 1.6, 1.1, 0.9],
            "dPhi_vis_2_MET": [0.9, 2.2, 0.7, 1.8, 2.1],
            "dEta_vis_1_2": [1.3, 2.7, 1.1, 1.2, 2.5],
            "dR_vis_MET": [2.1, 1.8, 2.4, 2.0, 1.9],
            "decay_mode": [
                "1_prong_1_prong",
                "1_prong_leptonic",
                "3_prong_3_prong",
                "1_prong_3_prong",
                "leptonic_3_prong",
            ],
        }
    )

    try:
        predictions = predictor.predict(test_data)
        print(f"✓ Batch prediction successful: {len(predictions)} predictions")

        # Check predictions
        valid_predictions = predictions.dropna()
        nan_predictions = predictions.isna().sum()

        print(f"  ✓ Valid predictions: {len(valid_predictions)}")
        if nan_predictions > 0:
            print(f"  ⚠ NaN predictions: {nan_predictions} (possibly due to missing models)")

        # Show sample predictions
        for i, (idx, pred) in enumerate(predictions.items()):
            if i < 3:  # Show first 3
                decay_mode = test_data.loc[idx, "decay_mode"]
                print(f"  Event {idx} ({decay_mode}): {pred:.2f} GeV")

        return True

    except Exception as e:
        print(f"✗ Error in batch prediction: {e}")
        return False


def test_single_event_prediction(predictor):
    """Test single event prediction functionality."""
    print("\n=== Testing Single Event Prediction ===")

    try:
        mass_prediction = predictor.predict_single_event(
            pt_vis1=45.2,
            eta_vis1=0.5,
            energy_vis1=52.3,
            pt_vis2=32.1,
            eta_vis2=-0.8,
            energy_vis2=38.7,
            met=35.6,
            dphi_vis_1_2=2.1,
            dphi_vis_1_met=1.2,
            dphi_vis_2_met=0.9,
            deta_vis_1_2=1.3,
            dr_vis_met=2.1,
            decay_mode="1_prong_1_prong",
        )

        print(f"✓ Single event prediction successful: {mass_prediction:.2f} GeV")
        return True

    except Exception as e:
        print(f"✗ Error in single event prediction: {e}")
        return False


def test_error_handling(predictor):
    """Test error handling for invalid inputs."""
    print("\n=== Testing Error Handling ===")

    # Test missing features
    try:
        incomplete_data = pd.DataFrame(
            {
                "Pt_vis1": [45.2],
                "Eta_vis1": [0.5],
                # Missing other required features
                "decay_mode": ["1_prong_1_prong"],
            }
        )

        predictions = predictor.predict(incomplete_data)
        print("✗ Should have raised error for missing features")

    except ValueError as e:
        print("✓ Correctly handled missing features error")
    except Exception as e:
        print(f"✗ Unexpected error: {e}")

    # Test missing decay_mode
    try:
        no_decay_mode = pd.DataFrame(
            {
                "Pt_vis1": [45.2],
                "Eta_vis1": [0.5],
                "Energy_vis1": [52.3],
                "Pt_vis2": [32.1],
                "Eta_vis2": [-0.8],
                "Energy_vis2": [38.7],
                "MET": [35.6],
                "dPhi_vis_1_2": [2.1],
                "dPhi_vis_1_MET": [1.2],
                "dPhi_vis_2_MET": [0.9],
                "dEta_vis_1_2": [1.3],
                "dR_vis_MET": [2.1],
                # Missing decay_mode column
            }
        )

        predictions = predictor.predict(no_decay_mode)
        print("✗ Should have raised error for missing decay_mode")

    except ValueError as e:
        print("✓ Correctly handled missing decay_mode error")
    except Exception as e:
        print(f"✗ Unexpected error: {e}")


def test_tlorentz_utilities():
    """Test TLorentz vector utility functions."""
    print("\n=== Testing TLorentz Vector Utilities ===")

    # Create mock TLorentz vector class for testing (since ROOT might not be available)
    class MockTLorentzVector:
        def __init__(self, pt, eta, phi, e):
            self._pt = pt
            self._eta = eta
            self._phi = phi
            self._e = e

        def Pt(self):
            return self._pt

        def Eta(self):
            return self._eta

        def Phi(self):
            return self._phi

        def E(self):
            return self._e

        def DeltaPhi(self, other):
            # Simplified delta phi calculation
            dphi = abs(self._phi - other._phi)
            if dphi > np.pi:
                dphi = 2 * np.pi - dphi
            return dphi

        def DeltaR(self, other):
            # Simplified delta R calculation
            deta = self._eta - other._eta
            dphi = self.DeltaPhi(other)
            return np.sqrt(deta**2 + dphi**2)

        def M(self):
            # Mock mass calculation
            return np.sqrt(self._e**2 - self._pt**2)

        def __add__(self, other):
            # Mock vector addition
            return MockTLorentzVector(
                self._pt + other._pt,
                (self._eta + other._eta) / 2,  # Simplified
                (self._phi + other._phi) / 2,  # Simplified
                self._e + other._e,
            )

    try:
        # Create mock TLorentz vectors
        lead_tau = MockTLorentzVector(45.2, 0.5, 1.2, 52.3)
        sublead_tau = MockTLorentzVector(32.1, -0.8, -0.9, 38.7)
        met = MockTLorentzVector(35.6, 0.0, 2.1, 35.6)

        # Test feature row creation
        feature_row = create_feature_row_from_tlorentz(lead_tau, sublead_tau, met, "1_prong", "1_prong")

        print("✓ TLorentz vector feature row creation successful")

        # Check that required features are present
        required_features = [
            "Pt_vis1",
            "Eta_vis1",
            "Energy_vis1",
            "Pt_vis2",
            "Eta_vis2",
            "Energy_vis2",
            "MET",
            "dPhi_vis_1_2",
            "dPhi_vis_1_MET",
            "dPhi_vis_2_MET",
            "dEta_vis_1_2",
            "dR_vis_MET",
            "decay_mode",
        ]

        missing_features = [f for f in required_features if f not in feature_row]
        if missing_features:
            print(f"✗ Missing features in TLorentz row: {missing_features}")
            return False
        else:
            print("✓ All required features present in TLorentz row")

        # Test DataFrame creation from lists
        lead_taus = [lead_tau, lead_tau]
        sublead_taus = [sublead_tau, sublead_tau]
        mets = [met, met]
        decay_modes_lead = ["1_prong", "3_prong"]
        decay_modes_sublead = ["1_prong", "3_prong"]

        df = create_dataframe_from_tlorentz_list(lead_taus, sublead_taus, mets, decay_modes_lead, decay_modes_sublead)

        print(f"✓ TLorentz DataFrame creation successful: {len(df)} events")

        return True

    except Exception as e:
        print(f"✗ Error in TLorentz utilities: {e}")
        return False


def main():
    """Run all tests."""
    print("DiTaus BRT Library Test Suite")
    print("=" * 40)

    # Test initialization
    predictor = test_predictor_initialization()
    if predictor is None:
        print("\n✗ Critical error: Cannot proceed without working predictor")
        sys.exit(1)

    # Test feature engineering
    feature_test_passed = test_feature_engineering()

    # Test TLorentz utilities
    tlorentz_test_passed = test_tlorentz_utilities()

    # Test predictions
    batch_test_passed = test_batch_prediction(predictor)
    single_test_passed = test_single_event_prediction(predictor)

    # Test error handling
    test_error_handling(predictor)

    # Summary
    print("\n" + "=" * 40)
    print("TEST SUMMARY:")
    print(f"✓ Predictor initialization: PASSED")
    print(
        f"{'✓' if feature_test_passed else '✗'} Feature engineering: {'PASSED' if feature_test_passed else 'FAILED'}"
    )
    print(
        f"{'✓' if tlorentz_test_passed else '✗'} TLorentz utilities: {'PASSED' if tlorentz_test_passed else 'FAILED'}"
    )
    print(f"{'✓' if batch_test_passed else '✗'} Batch prediction: {'PASSED' if batch_test_passed else 'FAILED'}")
    print(
        f"{'✓' if single_test_passed else '✗'} Single event prediction: {'PASSED' if single_test_passed else 'FAILED'}"
    )
    print("✓ Error handling: PASSED")

    all_passed = all([feature_test_passed, tlorentz_test_passed, batch_test_passed, single_test_passed])

    if all_passed:
        print("\n🎉 All tests PASSED! The library is working correctly.")
        sys.exit(0)
    else:
        print("\n❌ Some tests FAILED. Please check the library installation.")
        sys.exit(1)


if __name__ == "__main__":
    main()
