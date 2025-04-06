# source ~/.bashrc && python3 src/backgrounds.py

import os
from subprocess import Popen

### GLOBAL VARIABLES ###
# Flag to determine whether to create outputs
create_outputs = False

# Path to the MG5_aMC software
mg5_path = "/Collider/MG5_aMC_v3_5_8"

# Get the current working directory
current_folder = os.getcwd()

# Create outputs directory if it doesn't exist
outputs_folder = os.path.join(current_folder, "outputs")
os.makedirs(outputs_folder, exist_ok=True)

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
def change_template(template: str, paths: dict) -> list:
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
            elif "N_SEED" in line:
                lines.append(line.replace("N_SEED", paths.get("N_SEED")))
            else:
                lines.append(line)
    return lines


# Function to extract the value of 'iseed' from a banner file
def get_iseed_from_banner(file_path: str) -> int:
    try:
        with open(file_path, "r") as file:
            for line in file:
                if "iseed" in line:
                    # Extract the value after '=' and convert to integer
                    return int(line.split("=")[0].strip())
        raise ValueError("iseed not found in the file.")
    except (FileNotFoundError, ValueError) as e:
        raise e


# Function to search for files in a directory using glob patterns
def search_files(directory: str, glob: str = "**/*") -> list:
    from pathlib import Path

    dir_path = Path(directory)
    return [file.as_posix() for file in dir_path.glob(glob)]


# Function to get iseed values from all banner files in a directory
def get_iseed_from_banners(directory: str) -> list:
    banners = search_files(directory, "**/*banner.txt")
    iseed_values = []
    for banner in banners:
        try:
            iseed = get_iseed_from_banner(banner)
            iseed_values.append(iseed)
        except Exception as e:
            print(f"Error processing {banner}: {e}")
    return iseed_values


# Function to generate a new unique iseed value
def generate_new_iseed(iseed_values: list, min_value: int = 1, max_value: int = 100000) -> list:
    import random

    new_iseed = random.randint(min_value, max_value)
    # Ensure the new iseed is unique
    while new_iseed in iseed_values:
        new_iseed = random.randint(min_value, max_value)
    # Append the new iseed to the list
    iseed_values.append(new_iseed)
    return iseed_values


### UPDATE FILES TO CREATE OUTPUTS ###

# Combine all paths into a single dictionary
all_paths = {key: value for paths in bkg_paths_dict.values() for key, value in paths.items()}

# Validate user input and select the corresponding background paths
try:
    type_bkg = int(type_bkg)
    bkg_paths = bkg_paths_dict[type_bkg]
    used_iseed_values = []
    for bkg in bkg_paths.values():
        iseed_values = get_iseed_from_banners(bkg)
        used_iseed_values += iseed_values
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

### UPDATE FILES TO LAUNCH BACKGROUNDS and LAUNCH MG5_aMC ###
# Define the number of runs for each background
n_runs = {
    "ttbar": 7,
    "top_w": 3,
    "top_jet": 2,
    "ww": 5,
    "wz": 5,
    "zz": 5,
    "w_jets": 10,
    "z_jets": 8,
}


# Dictionary to store paths to launch files for each background
bkg_launch_files = {}

# Generate launch files for each background
for bkg in bkg_paths.keys():
    bkg_name = bkg_paths[bkg].split("/")[-1]
    run_template_launch = os.path.join(current_folder, "outputs", f"bkg_launch_run_{bkg_name}.mg5")
    with open(run_template_launch, "w") as new_f:
        for i in range(n_runs[bkg_name]):
            dict1 = cards_paths.copy()
            dict1["PATH_TO_OUTPUT"] = bkg_paths[bkg]
            # Adjust the run card for jet-matching backgrounds
            if "_jets" in dict1["PATH_TO_OUTPUT"]:
                run_card = dict1["PATH_TO_RUN_CARD"]
                run_card = run_card.replace("run_card.dat", "run_card_w_jet_match.dat")
                dict1["PATH_TO_RUN_CARD"] = run_card
            # Generate the launch file with updated paths
            used_iseed_values = generate_new_iseed(used_iseed_values)
            dict1["N_SEED"] = str(used_iseed_values[-1])
            lines2 = change_template(template_launch, dict1)
            bkg_launch_files[bkg_name] = run_template_launch
            new_f.write("\n".join(lines2))
    Popen([os.path.join(mg5_path, "bin", "mg5_aMC"), bkg_launch_files[bkg_name]]).wait()

    # search for all the .lhe files in the bkg_paths[bkg] and delete them
    lhe_files = search_files(bkg_paths[bkg], "*.lhe.gz")
    for lhe_file in lhe_files:
        print(f"Deleting {lhe_file}")
        os.remove(lhe_file)

    # rsync with the final folder #change BKG_SM_new to BKG_SM, copy only the new and modified files
    sync_path = bkg_paths[bkg]
    sync_path = sync_path.replace("BKG_SM_new", "BKG_SM")
    os.makedirs(sync_path, exist_ok=True)
    print(f"Syncing {bkg_paths[bkg]} to {sync_path}")
    os.system(f"rsync -av --ignore-existing {bkg_paths[bkg]} {sync_path}")

    # search for all the .root files in the bkg_paths[bkg] and delete them
    root_files = search_files(bkg_paths[bkg], "*.root")
    for root_file in root_files:
        print(f"Deleting {root_file}")
        os.remove(root_file)

    # note that in the final folder the root files are not deleted, only the lhe files
