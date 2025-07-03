#!/bin/bash
### echo 1 | bash src/install_spheno_models.sh


# Use de mg5_env conda environment
# Activate the conda environment
# source /Collider/anaconda3/etc/profile.d/conda.sh
# conda activate mg5_env || {
#   echo "Failed to activate conda environment 'mg5_env'. Ensure it exists."; exit 1;
# }

# Base paths
PROJECT_DIR=$(pwd)
MODELS_DIR="$PROJECT_DIR/models"
SPHENO_DIR="$PROJECT_DIR/spheno"
BUILD_DIR="$SPHENO_DIR/build"

# Function to clone and compile SPheno
build_spheno() {
  echo "Cloning SPheno from the fork..."
  git clone https://github.com/Phenomenology-group-uniandes/SPheno.git "$SPHENO_DIR"

  echo "Compiling base SPheno..."
  mkdir -p "$BUILD_DIR" && cd "$BUILD_DIR" || exit 1
  cmake .. && make -j4 && sudo make install

  # Add BUILD_DIR to LD_LIBRARY_PATH in .bashrc if not already present
  if ! grep -q "export LD_LIBRARY_PATH=$BUILD_DIR:\$LD_LIBRARY_PATH" ~/.bashrc; then
    echo "export LD_LIBRARY_PATH=$BUILD_DIR:\$LD_LIBRARY_PATH" >> ~/.bashrc
    echo "Added $BUILD_DIR to LD_LIBRARY_PATH in .bashrc"
  else
    echo "$BUILD_DIR is already in LD_LIBRARY_PATH in .bashrc"
  fi
}

# Check if SPheno is already installed
if [ -d "$SPHENO_DIR" ]; then
  echo "SPheno is already installed in $SPHENO_DIR."
  echo "What would you like to do?"
  echo "1) Reinstall SPheno"
  echo "2) Use the existing installation for new models"
  echo "3) Do nothing and exit"
  read -p "Enter your choice (1/2/3): " CHOICE

  case "$CHOICE" in
    1)
      echo "Reinstalling SPheno..."
      sudo rm -rf "$SPHENO_DIR"
      build_spheno
      ;;
    2)
      echo "Using the existing SPheno installation for new models."
      ;;
    3)
      echo "Exiting without making any changes."
      exit 0
      ;;
    *)
      echo "Invalid choice. Exiting."
      exit 1
      ;;
  esac
else
  echo "SPheno is not installed. Installing now..."
  build_spheno
fi


# Models that require installation in SPheno
REQUIRED_MODELS=("U1T3R" "THDM")

# Install each model
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