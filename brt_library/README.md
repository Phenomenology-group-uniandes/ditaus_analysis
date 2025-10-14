# DiTaus BRT Library

A portable Python library for predicting ditau masses using pre-trained Boosted Regression Tree (BRT) models based on XGBoost.

## Overview

This library provides easy-to-use tools for predicting the invariant mass of ditau systems using machine learning models trained on different tau decay modes. The models were trained using kinematic variables from ditau events and can predict masses with improved resolution compared to visible mass reconstruction.

## Supported Decay Modes

The library includes trained models for the following tau pair decay modes:
- `1_prong_1_prong`: Both taus decay hadronically with 1 charged track
- `1_prong_3_prong`: One tau with 1 charged track, other with 3 charged tracks  
- `1_prong_leptonic`: One hadronic tau (1-prong), one leptonic tau
- `3_prong_3_prong`: Both taus decay hadronically with 3 charged tracks
- `leptonic_3_prong`: One leptonic tau, one hadronic tau (3-prong)
- `leptonic_leptonic`: Both taus decay leptonically

## Installation

### From tar.gz archive
```bash
# Extract the archive
tar -xzf ditaus_brt_library.tar.gz
cd brt_library

# Install dependencies
pip install -r requirements.txt

# Install the library in development mode
pip install -e .
```

### Manual installation
```bash
# Install required packages
pip install numpy pandas scikit-learn xgboost joblib

# Copy the ditaus_brt directory to your Python path
```

## Usage

### Basic Usage

```python
from ditaus_brt import BRTPredictor
import pandas as pd

# Initialize the predictor (automatically loads models)
predictor = BRTPredictor()

# Prepare your data as a pandas DataFrame
# Required columns: Pt_vis1, Eta_vis1, Energy_vis1, Pt_vis2, Eta_vis2, Energy_vis2,
#                  MET, dPhi_vis_1_2, dPhi_vis_1_MET, dPhi_vis_2_MET, 
#                  dEta_vis_1_2, dR_vis_MET, decay_mode

data = pd.DataFrame({
    'Pt_vis1': [45.2, 67.8, 89.1],
    'Eta_vis1': [0.5, -1.2, 0.8], 
    'Energy_vis1': [52.3, 78.9, 95.4],
    'Pt_vis2': [32.1, 43.2, 56.7],
    'Eta_vis2': [-0.8, 1.5, -0.3],
    'Energy_vis2': [38.7, 51.2, 62.8],
    'MET': [35.6, 42.1, 28.9],
    'dPhi_vis_1_2': [2.1, 2.8, 1.9],
    'dPhi_vis_1_MET': [1.2, 0.8, 1.6],
    'dPhi_vis_2_MET': [0.9, 2.2, 0.7],
    'dEta_vis_1_2': [1.3, 2.7, 1.1],
    'dR_vis_MET': [2.1, 1.8, 2.4],
    'decay_mode': ['1_prong_1_prong', '1_prong_leptonic', '3_prong_3_prong']
})

# Get predictions
predictions = predictor.predict(data)
print("BRT Mass Predictions:", predictions.values)
```

### Single Event Prediction

```python
# Predict for a single event
mass_prediction = predictor.predict_single_event(
    pt_vis1=45.2, eta_vis1=0.5, energy_vis1=52.3,
    pt_vis2=32.1, eta_vis2=-0.8, energy_vis2=38.7,
    met=35.6, dphi_vis_1_2=2.1, dphi_vis_1_met=1.2,
    dphi_vis_2_met=0.9, deta_vis_1_2=1.3, dr_vis_met=2.1,
    decay_mode='1_prong_1_prong'
)
print(f"Predicted mass: {mass_prediction:.2f} GeV")
```

### Working with ROOT TLorentz Vectors

If you're working with ROOT TLorentz vectors (common in HEP analysis), you can use the utility functions:

```python
from ditaus_brt import BRTPredictor, create_feature_row_from_tlorentz, predict_from_tlorentz
from ROOT import TLorentzVector

# Initialize predictor
predictor = BRTPredictor()

# Create TLorentz vectors (example)
lead_tau = TLorentzVector()
lead_tau.SetPtEtaPhiE(45.2, 0.5, 1.2, 52.3)

sublead_tau = TLorentzVector()  
sublead_tau.SetPtEtaPhiE(32.1, -0.8, -0.9, 38.7)

met = TLorentzVector()
met.SetPtEtaPhiE(35.6, 0.0, 2.1, 35.6)

# Method 1: Create feature row and predict manually
feature_row = create_feature_row_from_tlorentz(
    lead_tau, sublead_tau, met,
    decay_mode_lead="1_prong", 
    decay_mode_sublead="1_prong"
)

# Convert to DataFrame and predict
import pandas as pd
df = pd.DataFrame([feature_row])
prediction = predictor.predict(df).iloc[0]

# Method 2: Direct prediction from TLorentz vectors
prediction = predict_from_tlorentz(
    predictor, lead_tau, sublead_tau, met,
    decay_mode_lead="1_prong",
    decay_mode_sublead="1_prong"
)

print(f"Predicted mass: {prediction:.2f} GeV")
```

### Utility Functions

```python
# Check available models
print("Available models:", predictor.get_available_models())

# Get required feature names
print("Required features:", predictor.get_feature_names())

# Check predictor status
print(predictor)
```

## Input Features

The library requires the following kinematic variables:

### Required Features:
- `Pt_vis1`, `Eta_vis1`, `Energy_vis1`: Leading visible tau kinematics
- `Pt_vis2`, `Eta_vis2`, `Energy_vis2`: Subleading visible tau kinematics  
- `MET`: Missing transverse energy
- `dPhi_vis_1_2`: Delta phi between the two visible taus
- `dPhi_vis_1_MET`: Delta phi between leading tau and MET
- `dPhi_vis_2_MET`: Delta phi between subleading tau and MET
- `dEta_vis_1_2`: Delta eta between the two visible taus
- `dR_vis_MET`: Delta R between ditau system and MET
- `decay_mode`: String indicating the decay mode (see supported modes above)

### Feature Engineering
The library automatically creates advanced features from the basic inputs:
- Trigonometric functions of angular variables
- Energy and momentum ratios
- MET projections (parallel/perpendicular)
- Momentum imbalance measures

## Model Details

- **Algorithm**: XGBoost (Gradient Boosting)
- **Training Target**: Truth-level ditau invariant mass
- **Input**: Reconstructed kinematic variables
- **Segmentation**: Separate models per tau decay mode for optimal performance
- **Performance**: Improved mass resolution compared to visible mass reconstruction

## File Structure

```
brt_library/
├── README.md
├── requirements.txt
├── setup.py
├── test_library.py
└── ditaus_brt/
    ├── __init__.py
    ├── predictor.py      # Main BRTPredictor class
    ├── features.py       # Feature engineering functions
    └── models/           # Pre-trained model files
        ├── __init__.py
        ├── xgb_model_1_prong_1_prong.pkl
        ├── xgb_model_1_prong_3_prong.pkl
        ├── xgb_model_1_prong_leptonic.pkl
        ├── xgb_model_3_prong_3_prong.pkl
        ├── xgb_model_leptonic_3_prong.pkl
        └── xgb_model_leptonic_leptonic.pkl
```

## Requirements

- Python >= 3.7
- numpy >= 1.21.0
- pandas >= 1.3.0
- scikit-learn >= 1.0.0
- xgboost >= 1.5.0
- joblib >= 1.1.0

## Testing

Run the test script to verify the library works correctly:

```bash
python test_library.py
```

## Troubleshooting

### Common Issues:

1. **Missing models warning**: Some decay mode models might not be available. The library will assign NaN for those cases.

2. **Feature mismatch**: Ensure your DataFrame contains all required features with exact column names.

3. **Import errors**: Make sure the library is properly installed and in your Python path.

### Performance Notes:

- The library is optimized for batch predictions (DataFrames with multiple events)
- Single event predictions are supported but less efficient for large datasets
- Models are loaded once during initialization for efficiency

## License

This library is part of the DiTaus analysis project from the Phenomenology Group at Universidad de los Andes.

## Authors

Phenomenology Group - Universidad de los Andes

## Citation

If you use this library in your research, please cite the relevant papers and acknowledge the DiTaus analysis project.