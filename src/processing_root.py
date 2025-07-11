# nohup bash -c 'python3 src/processing_root.py' > outputs/processing_root.log 2>&1 &
import os
import re
from pathlib import Path

from preselection import run_preselection


def convert(text):
    if text.isdigit():
        return int(text)
    else:
        return text.lower()


def alphanum_key(key):

    return [convert(c) for c in re.split("([0-9]+)", key)]


def natural_sort(list):

    return sorted(list, key=alphanum_key)


def get_forest(path_to_signal: str, glob: str = None) -> list:

    path_root = Path(path_to_signal)
    forest = [root_file.as_posix() for root_file in path_root.glob(glob)]
    return natural_sort(forest)


current_folder = os.getcwd()
path_to_bkg = os.path.join(current_folder, "outputs", "SM_Backgrounds")
path_to_signal = os.path.join(current_folder, "outputs", "signals")

print("Current folder:", current_folder)
print("Path to Backgrounds:", path_to_bkg)
print("Path to Signals:", path_to_signal)


def safe_run_preselection(file_path):
    try:
        run_preselection(file_path)
        return None
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        print("Continuing with the next file...")
        print("and retrying later.")
        return file_path


def preselect(forest):
    results = list(map(safe_run_preselection, forest))
    filed_files = [failed_file for failed_file in results if failed_file is not None]
    return filed_files


bkg_keys = [f for f in os.listdir(path_to_bkg) if os.path.isdir(os.path.join(path_to_bkg, f))]

signal_keys = [
    f for f in os.listdir(path_to_signal) if os.path.isdir(os.path.join(path_to_signal, f))
]


overwrite = True
i = 0
while True:
    i = i + 1
    trees_to_be_processed = list()

    bkg_forests = {
        folder: get_forest(os.path.join(path_to_bkg, folder), "**/*.root") for folder in bkg_keys
    }

    signal_forests = {
        folder: get_forest(os.path.join(path_to_signal, folder), "**/*.root")
        for folder in signal_keys
    }

    for key in signal_forests.keys():
        for root_file in signal_forests[key]:
            feather_file = root_file.replace(".root", "_ditaus.feather")
            if not os.path.exists(feather_file) or overwrite:
                trees_to_be_processed.append(root_file)
    for key in bkg_forests.keys():
        for root_file in bkg_forests[key]:
            feather_file = root_file.replace(".root", "_ditaus.feather")
            if not os.path.exists(feather_file) or overwrite:
                trees_to_be_processed.append(root_file)

    os.system("sleep 120")  # wait for 2 minutes before next iteration
    patata = preselect(trees_to_be_processed[:])
    overwrite = False
    print(f"Iteration {i} completed. {len(patata)} files failed to process.")
    [print(f"Failed file: {f}") for f in patata]
