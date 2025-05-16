# nohup bash -c 'python3 src/signals.py' > outputs/signals.log 2>&1 &

import os
import shutil
from subprocess import Popen

import numpy as np

from mg5_helpers import (
    change_template,
    generate_new_iseed,
    get_iseed_from_banners,
    search_files,
)

### GLOBAL VARIABLES ###
# Number of runs to be performed
# Remember that pythia8 only accepts 50k events per run
expected_events = int(500e3)
n_runs = int(expected_events / 50e3)

# Flag to determine whether to create outputs
create_outputs = True

# Path to the MG5_aMC software
mg5_path = "/Collider/anaconda3/envs/mg5_env"
mg5_aMC_bin = os.path.join(mg5_path, "bin", "mg5_aMC")

# path to storage
storage_path = "/hep-server2_disks/disco4/personal_folder/cfrc/"

# Get the current working directory
current_folder = os.getcwd()
models_folder = os.path.join(current_folder, "models")

# Copy current_folder/MinBias.pileup to /tmp/delphes/MinBias.pileup
pileup_file = os.path.join(current_folder, "MinBias.pileup")
dst_dir = "/tmp/delphes"
dst_file = os.path.join(dst_dir, "MinBias.pileup")
os.makedirs(dst_dir, exist_ok=True)
shutil.copy2(pileup_file, dst_file)

# Create outputs directory if it doesn't exist
outputs_folder = os.path.join(current_folder, "outputs")
os.makedirs(outputs_folder, exist_ok=True)


# Define paths to template files
template_launch = os.path.join(current_folder, "src/launch.mg5")
template_outputs = os.path.join(current_folder, "src/signal_outputs.mg5")


cards_paths = {
    "PATH_TO_RUN_CARD": "src/run_card.dat",
    "PATH_TO_PARAM_CONFIGS": "",
    "PATH_TO_PYTHIA_CARD": "src/pythia8_card.dat",
    "PATH_TO_DELPHES_CARD": "src/delphes_card_CMS.dat",
}

# UFO_BY MODEL
models = [
    "sLQ",
    "vLQ",
    "Zprime",
    # "THDM",
    # "U1T3R",
]

ufos_dir = {model: os.path.join(models_folder, model, "UFO") for model in models}
param_config_dir = {
    model: os.path.join(models_folder, model, "Param_Configs.mg5") for model in models
}
final_sim_Path = {model: os.path.join(storage_path, model) for model in models}
# create the final simulation path if it doesn't exist
[os.makedirs(final_sim_Path[model], exist_ok=True) for model in models]

for ufodir in ufos_dir.values():
    if not os.path.exists(ufodir):
        print(f"UFO directory {ufodir} does not exist. Please check the path.")
        exit(1)


mass_min = 500
mass_max = 5000
mass_step = 250

# check that the initial and final mass are connected by the step
if (mass_max - mass_min) % mass_step != 0:
    raise ValueError(
        "The mass range is not compatible with the step size. Please adjust the values."
    )

mass_range = np.arange(mass_min, mass_max + mass_step, mass_step)


for run in range(n_runs):
    for mass in mass_range:
        for model, ufodir in ufos_dir.items():
            model_dir = os.path.join(outputs_folder, model)
            working_dir = os.path.join(model_dir, str(mass))
            model_used_seeds = get_iseed_from_banners(model_dir)
            if create_outputs:
                os.makedirs(working_dir, exist_ok=True)
                output_lines = change_template(
                    template_outputs,
                    {
                        "UFO_PATH": ufodir,
                        "PATH_TO_OUTPUT_L": os.path.join(working_dir, "left"),
                        "PATH_TO_OUTPUT_R": os.path.join(working_dir, "right"),
                    },
                )
                proc_file = os.path.join(working_dir, "proc_card_mg5.dat")
                with open(proc_file, "w") as f:
                    f.writelines(output_lines)
                Popen([mg5_aMC_bin, proc_file], cwd=working_dir).wait()
            with open(param_config_dir[model], "r") as f:
                param_config_content = """{}""".format(f.read())
                param_config_content = param_config_content.replace("NP_Mass", str(mass))
            launch_file = os.path.join(working_dir, "launcher.mg5")
            template_launch = os.path.join(current_folder, "src/launch.mg5")
            with open(launch_file, "w") as new_f:
                for output in ["left", "right"]:
                    dict1 = cards_paths.copy()
                    dict1["PATH_TO_PARAM_CONFIGS"] = param_config_content
                    dict1["PATH_TO_OUTPUT"] = os.path.join(working_dir, output)
                    model_used_seeds = generate_new_iseed(model_used_seeds)
                    dict1["N_SEED"] = str(model_used_seeds[-1])
                    lines = change_template(template_launch, dict1)
                    new_f.writelines(lines)
            Popen([mg5_aMC_bin, launch_file], cwd=working_dir).wait()
            # search for all the .lhe files in the working directory and delete them
            lhe_files = search_files(working_dir, "**/*.lhe.gz")
            for lhe_file in lhe_files:
                print(f"Deleting {lhe_file}")
                os.remove(lhe_file)

            # sync the model directory with the final_sim_Path[model]
            os.system(f"rsync -ahP {model_dir} {final_sim_Path[model]}")

            # search for all the .root files in the working directory and delete them
            root_files = search_files(working_dir, "**/*.root")
            for root_file in root_files:
                print(f"Deleting {root_file}")
                os.remove(root_file)
    create_outputs = False
