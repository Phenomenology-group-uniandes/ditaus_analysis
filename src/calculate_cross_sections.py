import os

import numpy as np
import pandas as pd
from subprocess import Popen, DEVNULL

from io import StringIO
import itertools
from mg5_helpers import change_template

mg5_path = "/Collider/anaconda3/envs/mg5_env"
mg5_aMC_bin = os.path.join(mg5_path, "bin", "mg5_aMC")

# Get the current working directory
current_folder = os.getcwd()
models_folder = os.path.join(current_folder, "models")
# Create outputs directory if it doesn't exist
outputs_folder = os.path.join(current_folder, "outputs")
# outputs_folder = "/pheno-server_disks/disco1/temp"

os.makedirs(outputs_folder, exist_ok=True)

# UFO_BY MODEL
models = [
    "Zprime",
    "sLQ",
    "vLQ",
    # "THDM",
    # "U1T3R",
]

ufos_dir = {model: os.path.join(models_folder, model, "UFO") for model in models}
param_config_dir = {
    model: os.path.join(models_folder, model, "Param_Configs.mg5") for model in models
}

cards_paths = {
    "PATH_TO_RUN_CARD": os.path.join(current_folder, "src/run_card.dat"),
    "PATH_TO_PARAM_CONFIGS": "",
    "PATH_TO_PYTHIA_CARD": os.path.join(current_folder, "src/pythia8_card.dat"),
    "PATH_TO_DELPHES_CARD": os.path.join(current_folder, "src/delphes_card_CMS.dat"),
}

# final_sim_paths = {model: os.path.join(storage_path, model) for model in models}

# _ = [os.makedirs(path, exist_ok=True) for path in final_sim_paths.values()]


mass_min = 500
mass_max = 5000
mass_step = 50

# check that the initial and final mass are connected by the step
if (mass_max - mass_min) % mass_step != 0:
    raise ValueError(
        "The mass range is not compatible with the step size. Please adjust the values."
    )

mass_range = np.arange(mass_min, mass_max + mass_step, mass_step)

xs = pd.DataFrame()

xs["Mass"] = mass_range

for model, ufodir in ufos_dir.items():
    working_dir = os.path.join(outputs_folder, model)
    os.makedirs(working_dir, exist_ok=True)
    template_outputs = os.path.join(ufodir, "..", "proc_command.mg5")
    output_lines = change_template(
        template_outputs,
        {"UFO_PATH": ufodir, "SIGNAL_OUTPUT": working_dir},
    )
    proc_file = os.path.join(working_dir, "proc_command.mg5")
    with open(proc_file, "w") as f:
        f.writelines(output_lines)
    if True:
        Popen([mg5_aMC_bin, proc_file], cwd=working_dir).wait()

    template_launch = os.path.join(current_folder, "src/launch_xs.mg5")
    # Search for all the folders in the working directory
    subfolders = [
        os.path.join(working_dir, d)
        for d in os.listdir(working_dir)
        if os.path.isdir(os.path.join(working_dir, d))
    ]

    launch_file = os.path.join(working_dir, "launcher.mg5")
    with open(param_config_dir[model], "r") as f:
        param_config_content = """{}""".format(f.read())
    for output in subfolders:
        with open(launch_file, "w") as new_f:
            for mass in mass_range:
                dict1 = cards_paths.copy()
                launch = param_config_content
                launch = launch.replace("NP_Mass", str(mass))
                launch = launch.replace("NP_Width", str(mass / (16 * np.pi)))
                dict1["PATH_TO_PARAM_CONFIGS"] = launch
                dict1["PATH_TO_OUTPUT"] = os.path.join(working_dir, output)
                lines = change_template(template_launch, dict1)
                new_f.writelines(lines)
        print(f"Running MG5_aMC for model {model} in \n{output}")
        Popen([mg5_aMC_bin, launch_file], cwd=working_dir).wait()

        xs_file = os.path.join(output, "crossx.html")
        with open(xs_file, "r") as f:
            html_string = f.read()
        t = pd.read_html(StringIO(html_string))[0]
        xs[f"{model}_{os.path.basename(output)}"] = (
            t["Cross section (pb)"].str.split(" ").str[0].astype(float)
        )
xs.to_csv(os.path.join(current_folder, "data", "xs_signals.csv"), index=False)
