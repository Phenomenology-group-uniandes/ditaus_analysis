
import os
from subprocess import Popen

current_folder = os.getcwd()
print(current_folder)
template=os.path.join(current_folder,"ditaus_analysis/src/bkg_outputs.mg5")
bkg_paths = {"PATH_TO_TTBAR": "/disco1/BKG_SM_new/ttbar",
            "PATH_TO_STOP_JET":"/disco1/BKG_SM_new/top_jet",
            "PATH_TO_STOP_W":"/disco1/BKG_SM_new/top_w",
            "PATH_TO_SZ_JET":"/disco3/BKG_SM_new/z_jets",
            "PATH_TO_SW_JET":"/disco3/BKG_SM_new/w_jets",
            "PATH_TO_ZB":"/disco2/BKG_SM_new/zb",}

with open(template,"r") as f:
    lines = list()
    for line in f:
        if "output" in line:
            key=line.split(" ")[1]
            lines.append(line.replace(key,bkg_paths.get(key,"hola")))
        else: 
            lines.append(line)
    for line in lines:
        print(line)

run_template=os.path.join(current_folder,"bkg_outputs_run1.mg5")
with open(run_template,"w") as new_f:
    new_f.write('\n'.join(lines))

Popen([os.path.join("/Collider/MG5_aMC_v3_5_7", "bin", "mg5_aMC"), run_template]).wait()






