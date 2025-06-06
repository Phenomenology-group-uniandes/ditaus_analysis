# source ~/.bashrc && python3 src/backgrounds.py
# nohup bash -c 'source ~/.bashrc && echo 1 | python3 src/backgrounds.py' > outputs/disk1.log 2>&1 &
# tail -f outputs/disk1.log
# nohup bash -c 'source ~/.bashrc && echo 2 | python3 src/backgrounds.py' > outputs/disk2.log 2>&1 &
# tail -f outputs/disk2.log
# nohup bash -c 'source ~/.bashrc && echo 3 | python3 src/backgrounds.py' > outputs/disk3.log 2>&1 &
# tail -f outputs/disk3.log
# nohup bash -c 'echo 5 | python3 src/backgrounds.py' > outputs/disk5.log 2>&1 &
# tail -f outputs/disk5.log
# nohup bash -c 'echo 6 | python3 src/backgrounds.py' > outputs/disk6.log 2>&1 &
# tail -f outputs/disk6.log
# nohup bash -c 'echo 7 | python3 src/backgrounds.py' > outputs/disk7.log 2>&1 &
# tail -f outputs/disk7.log

import os
import shutil
from subprocess import Popen

from mg5_helpers import (
    change_template,
    generate_new_iseed,
    get_iseed_from_banners,
    search_files,
)

### GLOBAL VARIABLES ###

n_multiruns = 10

# Flag to determine whether to create outputs
create_outputs = False

# Path to the MG5_aMC software
mg5_path = "/Collider/anaconda3/envs/mg5_env"

# Get the current working directory
current_folder = os.getcwd()

# Copy (and overwrite if it is necesary) current_folder/MinBias.pileup to /tmp/delphes/MinBias.pileup
pileup_file = os.path.join(current_folder, "MinBias.pileup")
dst_dir = "/tmp/delphes"
dst_file = os.path.join(dst_dir, "MinBias.pileup")

os.makedirs(dst_dir, exist_ok=True)
shutil.copy2(pileup_file, dst_file)

# Create outputs directory if it doesn't exist
outputs_folder = os.path.join(current_folder, "outputs")
os.makedirs(outputs_folder, exist_ok=True)

# Define paths to template files
template_outputs = os.path.join(current_folder, "src/bkg_outputs.mg5")
template_launch = os.path.join(current_folder, "src/launch.mg5")

# Prompt the user to select a disk type
type_bkg = input("Selecciona el disco (1, 2, 3, 5, 6, 7): ")

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
    5: {
        "PATH_TO_TTX": "/disco5/BKG_SM_new/ttbarx",
        "PATH_TO_BBX": "/disco5/BKG_SM_new/bbarx",
        "PATH_TO_TTW": "/disco5/BKG_SM_new/ttbarw",
    },
    6: {
        "PATH_TO_TAUPTAU": "/disco6/BKG_SM_new/DY_tautau",
    },
    7: {
        "PATH_TO_QCD": "/disco7/BKG_SM_new/QCD_jets",
    },
}


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
    raise ValueError("Entrada inválida. Por favor selecciona 1, 2, 3, 5, 6 o 7.")

# Define paths to configuration cards
cards_paths = {
    "PATH_TO_PARAM_CONFIGS": "",  # The backgrounds must to use the default Param Card from SM
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
    "ttbarx": 5,
    "bbarx": 5,
    "ttbarw": 5,
    "DY_tautau": 12,
    "QCD_jets": 12,
}

# Dictionary to store paths to launch files for each background
bkg_launch_files = {}

for i in range(n_multiruns):
    # Generate launch files for each background
    for bkg in bkg_paths.keys():
        bkg_name = bkg_paths[bkg].split("/")[-1]
        run_template_launch = os.path.join(
            current_folder, "outputs", f"bkg_launch_run_{bkg_name}.mg5"
        )
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
        lhe_files = search_files(bkg_paths[bkg], "**/*.lhe.gz")
        for lhe_file in lhe_files:
            print(f"Deleting {lhe_file}")
            os.remove(lhe_file)

        # rsync with the final folder #change BKG_SM_new to BKG_SM, copy only the new and modified files
        sync_path = bkg_paths[bkg]
        sync_path = sync_path.replace("BKG_SM_new", "BKG_SM")
        os.makedirs(sync_path, exist_ok=True)
        print(f"Syncing {bkg_paths[bkg]} to {sync_path}")
        os.system(f"rsync -ahP {bkg_paths[bkg]} {sync_path}")

        # search for all the .root files in the bkg_paths[bkg] and delete them
        root_files = search_files(bkg_paths[bkg], "**/*.root")
        for root_file in root_files:
            print(f"Deleting {root_file}")
            os.remove(root_file)

        # note that in the final folder the root files are not deleted, only the lhe files

        print(f"Finished {bkg_name} run {i+1}/{n_multiruns}")

print(f"Finished {n_multiruns} runs for all backgrounds in disk {type_bkg}.")
