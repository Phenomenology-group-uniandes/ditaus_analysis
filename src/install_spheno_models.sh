#!/bin/bash

# Use de mg5_env conda environment
# Activate the conda environment
source /Collider/anaconda3/etc/profile.d/conda.sh
conda activate mg5_env || {
  echo "Failed to activate conda environment 'mg5_env'. Ensure it exists."; exit 1;
}

# Base paths
PROJECT_DIR=$(pwd)
MODELS_DIR="$PROJECT_DIR/models"
SPHENO_DIR="$PROJECT_DIR/spheno"

# Check if SPheno is already install
if [ -d "$SPHENO_DIR" ]; then
  echo "SPheno is already installed in $SPHENO_DIR."
  read -p "Do you want to reinstall it? (y/n): " REINSTALL
  if [[ "$REINSTALL" != "y" ]]; then
    echo "Exiting without reinstalling SPheno."
    exit 0
  else
    echo "Reinstalling SPheno..."
    rm -rf "$SPHENO_DIR"
  fi
fi

echo "Cloning SPheno from the fork..."
git clone https://github.com/Phenomenology-group-uniandes/SPheno.git "$SPHENO_DIR" 

echo "Compiling base SPheno..."
BUILD_DIR="$SPHENO_DIR/build"
mkdir -p "$BUILD_DIR" && cd "$BUILD_DIR" || exit 1
cmake .. && make -j4 && sudo make install 

# Models that require installation in SPheno
REQUIRED_MODELS=("THDM" "U1T3R")

# Install only the selected models
for MODEL in "${REQUIRED_MODELS[@]}"; do
  MODEL_PATH="$MODELS_DIR/$MODEL"
  SPHENO_MODEL_PATH="$MODEL_PATH/SPheno"

  if [ -d "$SPHENO_MODEL_PATH" ]; then
    echo "Installing model $MODEL..."
    cd "$BUILD_DIR"
    rm -f "../models/$MODEL"
    ln -s "$SPHENO_MODEL_PATH" "$SPHENO_DIR/models/$MODEL"
    
    cmake .. -DMODELS=$MODEL && make -j4 && sudo make install 

    echo "Model $MODEL installed successfully."
  else
    echo "Skipping $MODEL: $SPHENO_MODEL_PATH not found"
  fi
done

echo "SPheno and the selected models were installed successfully."