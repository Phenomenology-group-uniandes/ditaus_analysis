# source ~/.bashrc && python3 /home/a.parrao/ditaus_analysis/src/backgrounds.py

import os
from subprocess import Popen

### GLOBAL VARIABLES ###

# Flag to determine whether to create outputs
create_outputs = False

# Path to the MG5_aMC software
mg5_path = "/Collider/MG5_aMC_v3_5_8"

# Get the current working directory
current_folder = os.getcwd()

# Define paths to template files
template_outputs = os.path.join(current_folder, "src/bkg_outputs.mg5")
template_launch = os.path.join(current_folder, "src/bkg_launch.mg5")

# Prompt the user to select a disk type
type_bkg = input("Selecciona el disco (1, 2, 3):\n")

# Dictionary mapping disk types to background paths
bkg_paths_dict = {
    1: {
        "PATH_TO_TTBAR": "/disco1/BKG_SM_new/ttbar",
        "PATH_TO_STOP_W": "/disco1/BKG_SM_new/top_w",
        "PATH_TO_STOP_JET": "/disco1/BKG_SM_new/top_jet",
    },
    2: {
        "PATH_TO_WW": "/disco2/BKG_SM_new/ww",
        "PATH_TO_WZ": "/disco2/BKG_SM_new/wz",
        "PATH_TO_ZZ": "/disco2/BKG_SM_new/zz",
    },
    3: {
        "PATH_TO_SW_JET": "/disco3/BKG_SM_new/w_jets",
        "PATH_TO_SZ_JET": "/disco3/BKG_SM_new/z_jets",
    },
}


### USEFUL FUNCTIONS ###
# Function to replace placeholders in a template file with actual paths
def change_template(template, paths):
    with open(template, "r") as f:
        lines = list()
        for line in f:
            if "PATH_TO" in line:
                key = line.split(" ")[1]
                get_t = paths.get(key)
                if get_t is None:
                    key = line.strip()
                    get_t = paths.get(key)
                lines.append(line.replace(key, get_t))
            else:
                lines.append(line)
    return lines


# Function to extract the value of 'iseed' from a banner file
def get_iseed_from_banner(file_path):
    try:
        with open(file_path, "r") as file:
            for line in file:
                if "iseed" in line:
                    # Split the line and extract the value before '='
                    iseed_value = line.split("=")[0].strip()
                    return int(iseed_value)
        raise ValueError("iseed not found in the file.")
    except FileNotFoundError:
        raise FileNotFoundError(f"The file {file_path} does not exist.")
    except ValueError as e:
        raise ValueError(f"Error reading iseed: {e}")


# Function to get all banner files in a directory
def get_banner_files(directory):
    from pathlib import Path

    dir_path = Path(directory)
    return [file.as_posix() for file in dir_path.glob("**/*_banner.txt")]


# Function to get iseed values from all banner files in a directory
def get_iseed_from_banners(directory):
    banners = get_banner_files(directory)
    iseed_values = []
    for banner in banners:
        try:
            iseed = get_iseed_from_banner(banner)
            iseed_values.append(iseed)
        except Exception as e:
            print(f"Error processing {banner}: {e}")
    return iseed_values


### UPDATE FILES TO CREATE OUTPUTS ###

# Combine all paths into a single dictionary
all_paths = {key: value for paths in bkg_paths_dict.values() for key, value in paths.items()}

# Validate user input and select the corresponding background paths
try:
    type_bkg = int(type_bkg)
    bkg_paths = bkg_paths_dict[type_bkg]
except (ValueError, KeyError):
    raise ValueError("Entrada inválida. Por favor selecciona 1, 2 o 3.")

# Define paths to configuration cards
cards_paths = {
    "PATH_TO_RUN_CARD": "src/run_card.dat",
    "PATH_TO_PYTHIA_CARD": "src/pythia8_card.dat",
    "PATH_TO_DELPHES_CARD": "src/delphes_card_CMS.dat",
}

# Update card paths to include the current working directory
cards_paths = {key: os.path.join(current_folder, value) for key, value in cards_paths.items()}

# Generate the output template file with updated paths
lines1 = change_template(template_outputs, all_paths)
run_template_outputs = os.path.join(current_folder, "outputs", "bkg_outputs_run.mg5")
with open(run_template_outputs, "w") as new_f:
    new_f.write("\n".join(lines1))

### LAUNCH MG5_aMC TO CREATE OUTPUTS ###
# Optionally execute the output template script
if create_outputs:
    Popen([os.path.join(mg5_path, "bin", "mg5_aMC"), run_template_outputs]).wait()

### UPDATE FILES TO LAUNCH BACKGROUNDS ###

# Dictionary to store paths to launch files for each background
bkg_launch_files = {}

# Generate launch files for each background
for bkg in bkg_paths.keys():
    dict1 = cards_paths.copy()
    dict1["PATH_TO_OUTPUT"] = bkg_paths[bkg]
    # Adjust the run card for jet-matching backgrounds
    if "_jets" in dict1["PATH_TO_OUTPUT"]:
        run_card = dict1["PATH_TO_RUN_CARD"]
        run_card = run_card.replace("run_card.dat", "run_card_w_jet_match.dat")
        dict1["PATH_TO_RUN_CARD"] = run_card
    # Generate the launch file with updated paths
    lines2 = change_template(template_launch, dict1)
    bkg_name = bkg_paths[bkg].split("/")[-1]
    run_template_launch = os.path.join(current_folder, "outputs", f"bkg_launch_run_{bkg_name}.mg5")
    bkg_launch_files[bkg_name] = run_template_launch
    with open(run_template_launch, "w") as new_f:
        new_f.write("\n".join(lines2))


###LAUNCH MG5_aMC TO SIMULATE BACKGROUNDS###
# Define the number of runs for each background
n_runs = {
    "ttbar": 7,
    "top_w": 3,
    "top_jet": 2,
    "ww": 5,
    "wz": 5,
    "zz": 5,
    "w_jets": 8,
    "z_jets": 7,
}

# Execute the launch files for the specified number of runs
for bkg in bkg_launch_files.keys():
    for i in range(n_runs[bkg]):
        Popen([os.path.join(mg5_path, "bin", "mg5_aMC"), bkg_launch_files[bkg]]).wait()
