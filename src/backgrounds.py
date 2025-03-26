# /bin/python3 /home/a.parrao/ditaus_analysis/src/backgrounds.py

import os
from subprocess import Popen

create_outputs = False


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


bkg_paths_1 = {
    "PATH_TO_TTBAR": "/disco1/BKG_SM_new/ttbar",
    "PATH_TO_STOP_W": "/disco1/BKG_SM_new/top_w",
    "PATH_TO_STOP_JET": "/disco1/BKG_SM_new/top_jet",
}

bkg_paths_3 = {
    "PATH_TO_SZ_JET": "/disco3/BKG_SM_new/z_jets",
    "PATH_TO_SW_JET": "/disco3/BKG_SM_new/w_jets",
}

all_paths = bkg_paths_1.copy()
all_paths.update(bkg_paths_3)
type_bkg = input("cual disco \n")

if int(type_bkg) == 1:
    bkg_paths = bkg_paths_1
elif int(type_bkg) == 3:
    bkg_paths = bkg_paths_3
else:
    raise Exception("Sorry, are you an dump guy?")


cards_paths = {
    "PATH_TO_RUN_CARD": "src/run_card.dat",
    "PATH_TO_PYTHIA_CARD": "src/pythia8_card.dat",
    "PATH_TO_DELPHES_CARD": "src/delphes_card_CMS.dat",
}

cards_paths = {key: os.path.join(current_folder, value) for key, value in cards_paths.items()}

########## /Collider/MG5_aMC_v3_5_7/bin/mg5_aMC /home/a.parrao/ditaus_analysis/outputs/bkg_launch_run_top_jet.mg5

# Create outputs

if create_outputs:
    lines1 = change_template(template_outputs, all_paths)
    run_template_outputs = os.path.join(current_folder, "outputs", "bkg_outputs_run.mg5")
    with open(run_template_outputs, "w") as new_f:
        new_f.write("\n".join(lines1))
    Popen(
        [os.path.join("/Collider/MG5_aMC_v3_5_7", "bin", "mg5_aMC"), run_template_outputs]
    ).wait()


bkg_launch_files = {}

for bkg in bkg_paths.keys():
    dict1 = cards_paths.copy()
    dict1["PATH_TO_OUTPUT"] = bkg_paths[bkg]
    lines2 = change_template(template_launch, dict1)
    bkg_name = bkg_paths[bkg].split("/")[-1]
    run_template_launch = os.path.join(current_folder, "outputs", f"bkg_launch_run_{bkg_name}.mg5")
    bkg_launch_files[bkg_name] = run_template_launch
    with open(run_template_launch, "w") as new_f:
        new_f.write("\n".join(lines2))

n_runs = {"ttbar": 4, "top_w": 1, "top_jet": 1, "z_jets": 7, "w_jets": 8}


for bkg in bkg_launch_files.keys():
    for i in range(n_runs[bkg]):
        Popen(
            [os.path.join("/Collider/MG5_aMC_v3_5_7", "bin", "mg5_aMC"), bkg_launch_files[bkg]]
        ).wait()
