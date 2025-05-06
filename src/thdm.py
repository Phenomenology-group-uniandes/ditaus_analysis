import numpy as np

mass_params_keys = {
    "MHL": "lightest Higgs mass",
    "MHH": "heavy Higgs mass",
    "MHA": "pseudo-scalar Higgs mass",
    "MHp": "charged Higgs mass",
    "m122": "squared z2 soft breaking mass",
    "cba": "cos(beta-alpha)",
    "tb": "tan(beta)",
    "vev": "vacuum expectation value",
}

lam_params_keys = {
    "lam1": "lambda_1",
    "lam2": "lambda_2",
    "lam3": "lambda_3",
    "lam4": "lambda_4",
    "lam5": "lambda_5",
    "m12_param": "m122",
    "tb_param": "tan_beta",
}


def get_lam_params(
    mass_params: dict,
    verbose: bool = False,
) -> dict:
    """
    Get the lambda parameters from the input dictionary
    """
    # check that mass_params has the required keys
    for key in mass_params_keys:
        if key not in mass_params:
            raise ValueError(f"Missing key {key} in mass_params")

    tb = mass_params.get("tb")
    cb = np.cos(np.atan(tb))
    sb = np.sin(np.atan(tb))
    beta = np.atan(tb)

    mhh = mass_params.get("MHH")
    mhl = mass_params.get("MHL", 125.1)
    ma = mass_params.get("MHA")
    mhp = mass_params.get("MHp")
    m122 = mass_params.get("m122")
    cba = mass_params.get("cba")
    sba = np.sqrt(1 - cba**2)
    vev = mass_params.get("vev", 246.22)
    lam_params = {}

    lam_params["lam5"] = (m122 / (sb * cb) - ma**2) / vev**2

    lam_params["lam4"] = 2 * (m122 / (sb * cb) - mhp**2) / vev**2 - lam_params["lam5"]

    alpha = beta - np.arccos(cba)
    ca = np.cos(alpha)
    sa = np.sin(alpha)

    R_alpha = np.array([[ca, sa], [-sa, ca]])
    R_alpha_inv = np.linalg.inv(R_alpha)

    Higgs_masses = np.array([mhh**2, mhl**2])

    # M = R_alpha . M_diag . R_alpha_inv
    phi_masses = np.dot(R_alpha, np.dot(np.diag(Higgs_masses), R_alpha_inv))
    a = phi_masses[0, 0]
    b = phi_masses[0, 1]
    c = phi_masses[1, 0]
    d = phi_masses[1, 1]

    l_345 = (b + m122) / (sb * cb * vev**2)
    lam_params["lam3"] = l_345 - lam_params["lam4"] - lam_params["lam5"]
    lam_params["lam2"] = (d - m122 / tb) / ((sb**2) * vev**2)
    lam_params["lam1"] = (a - m122 * tb) / ((cb**2) * vev**2)

    lam_params["m12_param"] = m122
    lam_params["tb_param"] = tb

    if verbose:
        print("lam1", lam_params["lam1"])
        print("lam2", lam_params["lam2"])
        print("lam3", lam_params["lam3"])
        print("lam4", lam_params["lam4"])
        print("lam5", lam_params["lam5"])
        print("m12_param", lam_params["m12_param"])
        print("tb_param", lam_params["tb_param"])

    return lam_params


def get_mass_params(lam_params, verbose=False):
    # check if lam_params has the required keys
    for key in lam_params_keys:
        if key not in lam_params:
            raise ValueError(f"Missing key {key} in lam_params")

    vev = 246.22

    l1 = lam_params.get("lam1")
    l2 = lam_params.get("lam2")
    l3 = lam_params.get("lam3")
    l4 = lam_params.get("lam4")
    l5 = lam_params.get("lam5")
    m12 = lam_params.get("m12_param")
    tb = lam_params.get("tb_param")
    cb = np.cos(np.arctan(tb))
    sb = np.sin(np.arctan(tb))
    l345 = l3 + l4 + l5

    square_mass_matrix = np.array(
        [
            [tb * m12 + l1 * vev**2 * cb**2, -m12 + l345 * vev**2 * sb * cb],
            [-m12 + l345 * vev**2 * sb * cb, (1 / tb) * m12 + l2 * vev**2 * sb**2],
        ]
    )

    MP = square_mass_matrix
    mass_params = {}
    mass_params["MHH"] = np.sqrt(
        0.5 * (MP[0, 0] + MP[1, 1] + np.sqrt((MP[0, 0] - MP[1, 1]) ** 2 + 4 * MP[0, 1] ** 2))
    )
    mass_params["MHL"] = np.sqrt(
        0.5 * (MP[0, 0] + MP[1, 1] - np.sqrt((MP[0, 0] - MP[1, 1]) ** 2 + 4 * MP[0, 1] ** 2))
    )
    mass_params["MHA"] = np.sqrt(m12 / (sb * cb) - l5 * vev**2)
    mass_params["MHp"] = np.sqrt(m12 / (sb * cb) - 0.5 * (l4 + l5) * vev**2)

    mass_params["m112"] = m12 * tb - 0.5 * vev**2 * (l1 * cb**2 + l345 * sb**2)
    mass_params["m222"] = m12 / tb - 0.5 * vev**2 * (l2 * sb**2 + l345 * cb**2)

    if verbose:
        print("MHH", mass_params["MHH"])
        print("MHL", mass_params["MHL"])
        print("MHA", mass_params["MHA"])
        print("MHp", mass_params["MHp"])
        print("m112", mass_params["m112"])
        print("m222", mass_params["m222"])

    return mass_params
