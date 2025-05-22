### USEFUL FUNCTIONS ###
# Function to replace placeholders in a template file with actual paths
def change_template(template: str, paths: dict) -> list:
    with open(template, "r") as f:
        lines = list()
        for line in f:
            if "SIGNAL_OUTPUT" in line:
                lines.append(line.replace("SIGNAL_OUTPUT", paths.get("SIGNAL_OUTPUT")))
            elif "PATH_TO" in line:
                key = line.split(" ")[1]
                get_t = paths.get(key)
                if get_t is None:
                    key = line.strip()
                    get_t = paths.get(key)
                lines.append(line.replace(key, get_t))
            elif "UFO_PATH" in line:
                lines.append(line.replace("UFO_PATH", paths.get("UFO_PATH")))
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
        raise ValueError(f"iseed not found in the file: {file_path}")
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
