# source ~/.bashrc && python3 /home/a.parrao/ditaus_analysis/src/backgrounds.py

import os
from subprocess import Popen

create_outputs = False

mg5_path = "/Collider/MG5_aMC_v3_5_8"


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


current_folder = os.getcwd()
template_outputs = os.path.join(current_folder, "src/bkg_outputs.mg5")
template_launch = os.path.join(current_folder, "src/bkg_launch.mg5")

type_bkg = input("Selecciona el disco (1, 2, 3):\n")

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

all_paths = {key: value for paths in bkg_paths_dict.values() for key, value in paths.items()}

try:
    type_bkg = int(type_bkg)
    bkg_paths = bkg_paths_dict[type_bkg]
except (ValueError, KeyError):
    raise ValueError("Entrada inválida. Por favor selecciona 1, 2 o 3.")


cards_paths = {
    "PATH_TO_RUN_CARD": "src/run_card.dat",
    "PATH_TO_PYTHIA_CARD": "src/pythia8_card.dat",
    "PATH_TO_DELPHES_CARD": "src/delphes_card_CMS.dat",
}

cards_paths = {key: os.path.join(current_folder, value) for key, value in cards_paths.items()}

# Create outputs


lines1 = change_template(template_outputs, all_paths)
run_template_outputs = os.path.join(current_folder, "outputs", "bkg_outputs_run.mg5")
with open(run_template_outputs, "w") as new_f:
    new_f.write("\n".join(lines1))

if create_outputs:
    Popen([os.path.join(mg5_path, "bin", "mg5_aMC"), run_template_outputs]).wait()


bkg_launch_files = {}

for bkg in bkg_paths.keys():
    dict1 = cards_paths.copy()
    dict1["PATH_TO_OUTPUT"] = bkg_paths[bkg]
    if "_jets" in dict1["PATH_TO_OUTPUT"]:
        run_card = dict1["PATH_TO_RUN_CARD"]
        run_card=run_card.replace("run_card.dat", "run_card_w_jet_match.dat")
        dict1["PATH_TO_RUN_CARD"] = run_card
    else:
        pass
    lines2 = change_template(template_launch, dict1)
    bkg_name = bkg_paths[bkg].split("/")[-1]
    run_template_launch = os.path.join(current_folder, "outputs", f"bkg_launch_run_{bkg_name}.mg5")
    bkg_launch_files[bkg_name] = run_template_launch
    with open(run_template_launch, "w") as new_f:
        new_f.write("\n".join(lines2))

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


for bkg in bkg_launch_files.keys():
    for i in range(n_runs[bkg]):
        Popen([os.path.join(mg5_path, "bin", "mg5_aMC"), bkg_launch_files[bkg]]).wait()
