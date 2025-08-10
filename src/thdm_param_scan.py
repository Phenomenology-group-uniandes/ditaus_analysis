import os

import numpy as np
import pandas as pd
import xslha
from scipy.integrate import quad
from tqdm.auto import tqdm


def get_params_vectorized(MHH, MHA, MHp, cba, lam5, sign_sba, tb=10, vev=246.22, mhl=125.35):

    MHH = np.asarray(MHH)
    MHA = np.asarray(MHA)
    MHp = np.asarray(MHp)
    cba = np.asarray(cba)

    beta = np.arctan(tb)
    cb = np.cos(beta)
    sb = np.sin(beta)

    sba = np.sin(np.arccos(cba)) * sign_sba

    m12sq = (MHA**2 + lam5 * vev**2) * (sb * cb)

    lam4 = 2 * (m12sq / (sb * cb) - MHp**2) / vev**2 - lam5

    alpha = beta - np.arcsin(sba)
    ca = np.cos(alpha)
    sa = np.sin(alpha)

    # Calculate phi_masses components (vectorized matrix multiplication)
    # phi_masses[0,0] = ca^2 * MHH^2 + sa^2 * mhl^2
    # phi_masses[0,1] = phi_masses[1,0] = ca*sa*(MHH^2 - mhl^2)
    # phi_masses[1,1] = sa^2 * MHH^2 + ca^2 * mhl^2

    a = ca**2 * MHH**2 + sa**2 * mhl**2
    b = ca * sa * (MHH**2 - mhl**2)
    c = b  # Matrix is symmetric
    d = sa**2 * MHH**2 + ca**2 * mhl**2

    # Calculate lambda parameters (vectorized)
    l_345 = (b + m12sq) / (sb * cb * vev**2)
    lam3 = l_345 - lam4 - lam5
    lam2 = (d - m12sq / tb) / (sb**2 * vev**2)
    lam1 = (a - m12sq * tb) / (cb**2 * vev**2)

    m_11sq = m12sq * tb - 0.5 * vev**2 * (lam1 * cb**2 + (lam3 + lam4 + lam5) * sb**2)
    m_22sq = m12sq / tb - 0.5 * vev**2 * (lam2 * sb**2 + (lam3 + lam4 + lam5) * cb**2)
    return {
        "lam1": lam1,
        "lam2": lam2,
        "lam3": lam3,
        "lam4": lam4,
        "lam5": lam5,
        "m12sq": m12sq,
        "m11sq": m_11sq,
        "m22sq": m_22sq,
        "tb_param": np.full_like(lam1, tb),
        "MHH": MHH,
        "MHA": MHA,
        "MHp": MHp,
        "cba": cba,
        "sba": sba,
    }


def calculate_random_sampling(mass_range, cba_range, delta_range, n_samples=100000, tb=10):
    vev = 246.22
    m_higgs = 125.35
    MHH_samples = np.random.uniform(mass_range[0] + m_higgs, mass_range[1], n_samples)
    MHA_samples = np.random.uniform(mass_range[0], mass_range[1], n_samples)
    MHp_samples = np.random.uniform(mass_range[0], mass_range[1], n_samples)
    # MHp_samples = np.random.uniform(570, 900, n_samples)
    cba_samples = np.random.uniform(cba_range[0], cba_range[1], n_samples)

    delta_samples = np.random.uniform(delta_range[0], delta_range[1], n_samples)
    lam5_samples = (MHH_samples**2 - MHA_samples**2) / vev**2 + delta_samples
    lam5_samples = np.random.normal(0, 12, n_samples)
    # Sample the sign of sin(beta-alpha) randomly for each point
    sign_sba_samples = np.random.choice([-1, 1], size=n_samples)

    results = get_params_vectorized(
        MHH_samples, MHA_samples, MHp_samples, cba_samples, lam5=lam5_samples, sign_sba=sign_sba_samples, tb=tb
    )
    results["delta_samples"] = delta_samples
    results["sign_sba"] = sign_sba_samples

    df = pd.DataFrame(results)
    return df


def check_vacuum_conditions(df, verbose=False):
    df_result = df.copy()

    lam1 = df_result["lam1"]
    lam2 = df_result["lam2"]
    lam3 = df_result["lam3"]
    lam4 = df_result["lam4"]
    lam5 = df_result["lam5"]
    tb = df_result["tb_param"]
    m12_squared = df_result["m12sq"]
    m11_squared = df_result["m11sq"]
    m22_squared = df_result["m22sq"]

    # Vacuum stability conditions
    stability_lam1_positive = lam1 > 0
    stability_lam2_positive = lam2 > 0

    # Initialize stability conditions as False
    stability_lam3_condition = np.full(len(df_result), False)
    stability_lam4_condition = np.full(len(df_result), False)
    valid_indices = df_result.query("lam1 * lam2 > 0").index

    stability_lam3_condition[valid_indices] = (
        lam3[valid_indices] + np.sqrt(lam1[valid_indices] * lam2[valid_indices])
    ) > 0
    stability_lam4_condition[valid_indices] = (
        lam3[valid_indices]
        + lam4[valid_indices]
        - np.abs(lam5[valid_indices])
        + np.sqrt(lam1[valid_indices] * lam2[valid_indices])
    ) > 0

    # Global minimum condition
    # k = (λ₁/λ₂)^(1/4)
    # Handle cases where lam1 or lam2 might be negative or zero
    valid_ratio = lam1 * lam2 > 0
    k = np.where(valid_ratio, (lam1 / lam2) ** (1 / 4), np.nan)

    # For the global minimum condition, we need m₁₁² and m₂₂²
    # From the 2HDM potential: m₁₁² = λ₁v², m₂₂² = λ₂v²
    vev = 246.22  # Default vev value
    m11_squared = m11_squared
    m22_squared = m22_squared

    # Global minimum condition: m₁₂²(m₁₁² - k²m₂₂²)(tan β - k) > 0
    global_min_condition = m12_squared * (m11_squared - k**2 * m22_squared) * (tb - k)
    global_minimum_condition = (global_min_condition > 0).fillna(False)

    # Overall vacuum stability
    vacuum_stable = (
        stability_lam1_positive
        & stability_lam2_positive
        & stability_lam3_condition
        & stability_lam4_condition
        & global_minimum_condition
    )

    # ==================== UNITARITY CONDITIONS ====================
    # Unitarity bound (all must be ≤ 8π)
    unitarity_bound = 8 * np.pi

    # Calculate unitarity parameters
    sum_lam12 = lam1 + lam2
    diff_lam12 = lam1 - lam2

    # a± = 3/2(λ₁+λ₂) ± √[9/4(λ₁-λ₂)² + (2λ₃+λ₄)²]
    sqrt_a = np.sqrt((9 / 4) * diff_lam12**2 + (2 * lam3 + lam4) ** 2)
    a_plus = (3 / 2) * sum_lam12 + sqrt_a
    a_minus = (3 / 2) * sum_lam12 - sqrt_a

    # b± = 1/2(λ₁+λ₂) ± √[1/4(λ₁-λ₂)² + λ₄²]
    sqrt_b = np.sqrt((1 / 4) * diff_lam12**2 + lam4**2)
    b_plus = (1 / 2) * sum_lam12 + sqrt_b
    b_minus = (1 / 2) * sum_lam12 - sqrt_b

    # c± = 1/2(λ₁+λ₂) ± √[1/4(λ₁-λ₂)² + λ₅²]
    sqrt_c = np.sqrt((1 / 4) * diff_lam12**2 + lam5**2)
    c_plus = (1 / 2) * sum_lam12 + sqrt_c
    c_minus = (1 / 2) * sum_lam12 - sqrt_c

    # e± = λ₃ + 2λ₄ ± 3λ₅
    e_plus = lam3 + 2 * lam4 + 3 * lam5
    e_minus = lam3 + 2 * lam4 - 3 * lam5

    # f± = λ₃ ± λ₄
    f_plus = lam3 + lam4
    f_minus = lam3 - lam4

    # g± = λ₃ ± λ₅
    g_plus = lam3 + lam5
    g_minus = lam3 - lam5

    # Check unitarity conditions (all absolute values must be ≤ 8π)
    unitarity_a_plus = np.abs(a_plus) <= unitarity_bound
    unitarity_a_minus = np.abs(a_minus) <= unitarity_bound
    unitarity_b_plus = np.abs(b_plus) <= unitarity_bound
    unitarity_b_minus = np.abs(b_minus) <= unitarity_bound
    unitarity_c_plus = np.abs(c_plus) <= unitarity_bound
    unitarity_c_minus = np.abs(c_minus) <= unitarity_bound
    unitarity_e_plus = np.abs(e_plus) <= unitarity_bound
    unitarity_e_minus = np.abs(e_minus) <= unitarity_bound
    unitarity_f_plus = np.abs(f_plus) <= unitarity_bound
    unitarity_f_minus = np.abs(f_minus) <= unitarity_bound
    unitarity_g_plus = np.abs(g_plus) <= unitarity_bound
    unitarity_g_minus = np.abs(g_minus) <= unitarity_bound

    # Overall unitarity condition (all individual conditions must be satisfied)
    unitarity_satisfied = (
        unitarity_a_plus
        & unitarity_a_minus
        & unitarity_b_plus
        & unitarity_b_minus
        & unitarity_c_plus
        & unitarity_c_minus
        & unitarity_e_plus
        & unitarity_e_minus
        & unitarity_f_plus
        & unitarity_f_minus
        & unitarity_g_plus
        & unitarity_g_minus
    )

    # Combined condition: vacuum stable AND global minimum AND unitarity
    all_conditions_satisfied = vacuum_stable & unitarity_satisfied

    # ==================== SAVE COLUMNS BASED ON VERBOSE FLAG ====================
    if verbose:
        # Save all individual condition columns for detailed analysis
        df_result["stability_lam1_positive"] = stability_lam1_positive
        df_result["stability_lam2_positive"] = stability_lam2_positive
        df_result["stability_lam1_2_condition"] = stability_lam1_positive & stability_lam2_positive
        df_result["stability_lam3_condition"] = stability_lam3_condition
        df_result["stability_lam4_condition"] = stability_lam4_condition
        df_result["stability_lam3_4_condition"] = stability_lam3_condition & stability_lam4_condition
        df_result["stability_lam1_2_3_4_condition"] = (
            stability_lam1_positive & stability_lam2_positive & stability_lam3_condition & stability_lam4_condition
        )
        df_result["global_minimum_condition"] = global_minimum_condition

        # Store unitarity parameters for analysis
        df_result["a_plus"] = a_plus
        df_result["a_minus"] = a_minus
        df_result["b_plus"] = b_plus
        df_result["b_minus"] = b_minus
        df_result["c_plus"] = c_plus
        df_result["c_minus"] = c_minus
        df_result["e_plus"] = e_plus
        df_result["e_minus"] = e_minus
        df_result["f_plus"] = f_plus
        df_result["f_minus"] = f_minus
        df_result["g_plus"] = g_plus
        df_result["g_minus"] = g_minus

        # Individual unitarity condition checks
        df_result["unitarity_a_plus"] = unitarity_a_plus
        df_result["unitarity_a_minus"] = unitarity_a_minus
        df_result["unitarity_b_plus"] = unitarity_b_plus
        df_result["unitarity_b_minus"] = unitarity_b_minus
        df_result["unitarity_c_plus"] = unitarity_c_plus
        df_result["unitarity_c_minus"] = unitarity_c_minus
        df_result["unitarity_e_plus"] = unitarity_e_plus
        df_result["unitarity_e_minus"] = unitarity_e_minus
        df_result["unitarity_f_plus"] = unitarity_f_plus
        df_result["unitarity_f_minus"] = unitarity_f_minus
        df_result["unitarity_g_plus"] = unitarity_g_plus
        df_result["unitarity_g_minus"] = unitarity_g_minus

        # Add intermediate calculations for analysis
        # df_result["k_parameter"] = k
        # df_result["global_min_expression"] = global_min_condition

    # Always save the unified conditions regardless of verbose flag
    df_result["vacuum_stable"] = vacuum_stable

    df_result["unitarity_satisfied"] = unitarity_satisfied
    df_result["Theoretical_constraints_satisfied"] = all_conditions_satisfied

    return df_result


current_dir = os.getcwd()


class STUCalculator:
    """
    Calculator for STU parameters in the Two-Higgs-Doublet Model (THDM)
    using SPheno for precision calculations

    Standard Model reference values and experimental constraints:
    S = 0.02 ± 0.10
    T = 0.07 ± 0.12
    U = 0.00 ± 0.09
    """

    def __init__(self, spheno_path=None, template_path=None, outputs_dir=None, inputs_dir=None):
        # Standard Model parameters (PDG 2020)
        self.MZ = 91.1876  # Z boson mass in GeV
        self.MW = 80.379  # W boson mass in GeV
        self.Mh_ref = 125.35  # Reference Higgs mass in GeV
        self.sw2 = 0.23121  # sin²(θW) - weak mixing angle

        # Experimental STU constraints (central values and errors)
        self.S_exp = 0.02
        self.T_exp = 0.07
        self.U_exp = 0.00
        self.S_err = 0.10
        self.T_err = 0.12
        self.U_err = 0.09

        # SPheno paths
        if spheno_path is None:
            self.spheno_path = os.path.join(current_dir, "spheno", "build", "THDM")
        else:
            self.spheno_path = spheno_path

        if template_path is None:
            self.template_path = os.path.join(current_dir, "models", "THDM", "Template.in")
        else:
            self.template_path = template_path

        if outputs_dir is None:
            self.outputs_dir = os.path.join(current_dir, "outputs", "SphenoOutputs")
            os.makedirs(self.outputs_dir, exist_ok=True)
        else:
            self.outputs_dir = outputs_dir

        if inputs_dir is None:
            self.inputs_dir = os.path.join(current_dir, "inputs", "SphenoInputs")
            os.makedirs(self.inputs_dir, exist_ok=True)
        else:
            self.inputs_dir = inputs_dir

        # Create outputs directory if it doesn't exist
        os.makedirs(self.outputs_dir, exist_ok=True)

        # Check if SPheno executable exists
        if not os.path.exists(self.spheno_path):
            raise FileNotFoundError(f"SPheno executable not found at {self.spheno_path}")

        # Check if template exists
        if not os.path.exists(self.template_path):
            raise FileNotFoundError(f"Template file not found at {self.template_path}")

    def check_stu_constraints(self, S, T, U, n_sigma=1.0):

        S_constraint = abs(S - self.S_exp) <= (n_sigma * self.S_err) if S is not None else False
        T_constraint = abs(T - self.T_exp) <= (n_sigma * self.T_err) if T is not None else False
        U_constraint = abs(U - self.U_exp) <= (n_sigma * self.U_err) if U is not None else False

        STU_constraint = S_constraint and T_constraint and U_constraint

        return {
            "S": S,
            "T": T,
            "U": U,
            "S_constraint": S_constraint,
            "T_constraint": T_constraint,
            "U_constraint": U_constraint,
            "STU_constraint": STU_constraint,
            "n_sigma_used": n_sigma,
            "S_exp": self.S_exp,
            "T_exp": self.T_exp,
            "U_exp": self.U_exp,
            "S_err": self.S_err,
            "T_err": self.T_err,
            "U_err": self.U_err,
        }

    def get_spheno_params(self, MHH, MHA, MHp, cba, lam5, sign_sba):
        params = get_params_vectorized(MHH, MHA, MHp, cba, lam5, sign_sba, tb=10, vev=246.22, mhl=125.35)

        spheno_params = {}
        spheno_params["lam1"] = str(params["lam1"] / 2.0)
        spheno_params["lam2"] = str(params["lam2"] / 2.0)
        spheno_params["lam3"] = str(params["lam3"])
        spheno_params["lam4"] = str(params["lam4"])
        spheno_params["lam5"] = str(params["lam5"])
        spheno_params["m12_param"] = str(params["m12sq"] * (-1))
        spheno_params["tb_param"] = str(params["tb_param"])

        return spheno_params

    def create_spheno_input(self, MHH, MHA, MHp, cba, lam5, sign_sba, input_file=None):
        import os
        import time

        # Read the template file
        with open(self.template_path, "r") as f:
            template_content = f.read()

        # Create parameter replacements dictionary
        replacements = self.get_spheno_params(MHH, MHA, MHp, cba, lam5, sign_sba=sign_sba)

        # Replace placeholders in template
        input_content = template_content
        for placeholder, value in replacements.items():
            input_content = input_content.replace(placeholder, value)

        # Generate output filename if not provided
        if input_file is None:
            timestamp = int(time.time() * 1000)  # millisecond precision
            input_file = os.path.join(self.inputs_dir, f"spheno_input_{timestamp}.in")

        # Ensure output directory exists
        os.makedirs(os.path.dirname(input_file), exist_ok=True)

        # Write the input file
        with open(input_file, "w") as f:
            f.write(input_content)

        return input_file

    def run_spheno(self, input_file, output_file=None):

        import os
        import subprocess
        import time

        # Generate output filename if not provided
        if output_file is None:
            input_file_base_name = os.path.basename(input_file)
            output_file = os.path.join(self.outputs_dir, input_file_base_name.replace(".in", ".out"))

        # Generate spectrum file name (.spc file)
        spc_file = output_file.replace(".out", ".spc")

        # Ensure output directory exists
        os.makedirs(os.path.dirname(output_file), exist_ok=True)

        # Check if input file exists
        if not os.path.exists(input_file):
            return {
                "success": False,
                "output_file": output_file,
                "spc_file": spc_file,
                "stdout": "",
                "stderr": f"Input file not found: {input_file}",
                "return_code": -1,
            }

        try:
            # Prepare environment for SPheno execution
            spheno_dir = os.path.dirname(self.spheno_path)

            # Ensure Messages.out file exists and is writable
            messages_file = os.path.join(spheno_dir, "Messages.out")
            try:
                if not os.path.exists(messages_file):
                    with open(messages_file, "w") as f:
                        f.write("# SPheno Messages\n")
                else:
                    # Ensure it's writable
                    import stat

                    current_permissions = os.stat(messages_file).st_mode
                    os.chmod(messages_file, current_permissions | stat.S_IWUSR | stat.S_IWGRP)
            except Exception as msg_error:
                print(f"Warning: Could not prepare Messages.out: {msg_error}")

            # Run SPheno command
            # SPheno typically expects: SPheno <input_file> <output_file>
            cmd = [self.spheno_path, input_file, spc_file]
            # Execute SPheno
            start_time = time.time()
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=300,  # 5 minute timeout
                cwd=spheno_dir,  # Run from SPheno directory
            )
            end_time = time.time()

            # Check if the spectrum file was created
            spc_exists = os.path.exists(spc_file)

            # Create a summary output file with execution info
            with open(output_file, "w") as f:
                f.write(f"SPheno Execution Summary\n")
                f.write(f"========================\n")
                f.write(f"Input file: {input_file}\n")
                f.write(f"Spectrum file: {spc_file}\n")
                f.write(f"Command: {' '.join(cmd)}\n")
                f.write(f"Return code: {result.returncode}\n")
                f.write(f"Execution time: {end_time - start_time:.2f} seconds\n")
                f.write(f"Spectrum file created: {spc_exists}\n")
                f.write(f"\nSTDOUT:\n{result.stdout}\n")
                f.write(f"\nSTDERR:\n{result.stderr}\n")

            return {
                "success": result.returncode == 0 and spc_exists,
                "output_file": output_file,
                "spc_file": spc_file if spc_exists else None,
                "stdout": result.stdout,
                "stderr": result.stderr,
                "return_code": result.returncode,
                "execution_time": end_time - start_time,
            }

        except subprocess.TimeoutExpired:
            return {
                "success": False,
                "output_file": output_file,
                "spc_file": spc_file,
                "stdout": "",
                "stderr": "SPheno execution timed out (>300 seconds)",
                "return_code": -2,
            }

        except Exception as e:
            return {
                "success": False,
                "output_file": output_file,
                "spc_file": spc_file,
                "stdout": "",
                "stderr": f"Error running SPheno: {str(e)}",
                "return_code": -3,
            }

    def parse_stu_from_spc(self, spc_file):
        try:
            slha_data = xslha.read(spc_file)

            spheno_block = slha_data.blocks["SPHENOLOWENERGY"]

            T = spheno_block["1"]  # T-parameter
            S = spheno_block["2"]  # S-parameter
            U = spheno_block["3"]  # U-parameter

            return (S, T, U)

        except FileNotFoundError:
            print(f"Error: SPheno spectrum file not found: {spc_file}")
            return (None, None, None)
        except KeyError as e:
            print(f"Error: Block or parameter not found in SLHA file {spc_file}: {str(e)}")
            return (None, None, None)
        except Exception as e:
            print(f"Error parsing SPheno spectrum file {spc_file}: {str(e)}")
            return (None, None, None)

    def calculate_STU(self, MHH, MHA, MHp, cba, lam5, sign_sba, input_file=None, output_file=None):
        input_file = self.create_spheno_input(MHH, MHA, MHp, cba, lam5, sign_sba=sign_sba, input_file=input_file)
        result = self.run_spheno(input_file, output_file=output_file)
        if not result["success"]:
            print(f"Error running SPheno: {result['stderr']}")
            return (None, None, None)

        S, T, U = self.parse_stu_from_spc(result["spc_file"])
        return (S, T, U)

    def calculate_STU_with_constraints(
        self, MHH, MHA, MHp, cba, lam5, sign_sba, n_sigma=1.0, input_file=None, output_file=None
    ):
        S, T, U = self.calculate_STU(
            MHH, MHA, MHp, cba, lam5, sign_sba, input_file=input_file, output_file=output_file
        )
        return self.check_stu_constraints(S, T, U, n_sigma=n_sigma)

    def calculate_STU_dataframe(self, df, n_sigma=1.0, verbose=False):
        """
        Calculate STU parameters for all rows in a dataframe and add constraint columns.

        Parameters:
        -----------
        df : pandas.DataFrame
            DataFrame containing columns: 'MHH', 'MHA', 'MHp', 'cba', 'lam5', 'sign_sba'
        n_sigma : float, optional
            Number of sigmas to use for constraints (default: 1.0)
        verbose : bool, optional
            If False, only adds S, T, U, and STU_constraint columns
            If True, adds all constraint details including experimental values and errors

        Returns:
        --------
        pandas.DataFrame
            Copy of input dataframe with additional STU constraint columns
        """
        df_result = df.copy()
        # Reset index to ensure consistent iteration
        df_result.reset_index(drop=True, inplace=True)

        # Initialize columns for STU parameters
        n_rows = len(df_result)
        S_values = np.full(n_rows, np.nan)
        T_values = np.full(n_rows, np.nan)
        U_values = np.full(n_rows, np.nan)
        STU_constraint_values = np.full(n_rows, False)

        if verbose:
            S_constraint_values = np.full(n_rows, False)
            T_constraint_values = np.full(n_rows, False)
            U_constraint_values = np.full(n_rows, False)
            n_sigma_used_values = np.full(n_rows, n_sigma)

        # Calculate STU for each row
        iterator = df_result.iterrows()
        if verbose:
            iterator = tqdm(iterator, total=len(df_result), desc="Calculating STU parameters")

        for i, row in iterator:
            try:
                result = self.calculate_STU_with_constraints(
                    row["MHH"],
                    row["MHA"],
                    row["MHp"],
                    row["cba"],
                    row["lam5"],
                    row["sign_sba"],
                    n_sigma=n_sigma,
                )

                S_values[i] = result["S"] if result["S"] is not None else np.nan
                T_values[i] = result["T"] if result["T"] is not None else np.nan
                U_values[i] = result["U"] if result["U"] is not None else np.nan
                STU_constraint_values[i] = result["STU_constraint"]

                if verbose:
                    S_constraint_values[i] = result["S_constraint"]
                    T_constraint_values[i] = result["T_constraint"]
                    U_constraint_values[i] = result["U_constraint"]

            except Exception as e:
                print(f"Error calculating STU for row {i}: {str(e)}")
                # Values remain as initialized (nan/False)
                continue

        # Add columns to dataframe
        df_result["S"] = S_values
        df_result["T"] = T_values
        df_result["U"] = U_values
        df_result["STU_constraint"] = STU_constraint_values
        if verbose:
            df_result["S_constraint"] = S_constraint_values
            df_result["T_constraint"] = T_constraint_values
            df_result["U_constraint"] = U_constraint_values
            df_result["n_sigma_used"] = n_sigma_used_values

        return df_result


class STUCalculatorAnalytical(STUCalculator):
    """
    Enhanced STU Calculator that inherits from STUCalculator but overrides the STU calculation
    method to use analytical calculations with Passarino-Veltman functions instead of SPheno.

    This provides faster calculations for parameter scans while maintaining the same interface.
    """

    def __init__(self, spheno_path=None, template_path=None, outputs_dir=None, inputs_dir=None):
        # Initialize parent class
        super().__init__(spheno_path, template_path, outputs_dir, inputs_dir)

        # Additional parameter for analytical calculations
        # Delta_finite is a regularization parameter that cancels in finite differences
        self.Delta_finite = 0.0  # Can be set to any finite value since it cancels out

    def B0_integrand(self, x, q2, m1_2, m2_2):
        """Integrand for B0 function"""
        X = m1_2 * x + m2_2 * (1 - x) - q2 * x * (1 - x)
        # Add small imaginary part to handle singularities
        return np.log(X - 1j * 1e-10)

    def B22_integrand(self, x, q2, m1_2, m2_2):
        """Integrand for B22 function"""
        X = m1_2 * x + m2_2 * (1 - x) - q2 * x * (1 - x)
        # Add small imaginary part to handle singularities
        return X * np.log(X - 1j * 1e-10)

    def B0(self, q2, m1_2, m2_2):
        """
        Passarino-Veltman B0 function
        B0(q²; m1², m2²) = Δ - ∫₀¹ dx log(X - iε)
        Since Δ contains divergences that cancel in finite differences, we use the finite part
        """
        try:
            # Real part of the integral
            integral_real, _ = quad(lambda x: np.real(self.B0_integrand(x, q2, m1_2, m2_2)), 0, 1, limit=100)
            # Imaginary part of the integral
            integral_imag, _ = quad(lambda x: np.imag(self.B0_integrand(x, q2, m1_2, m2_2)), 0, 1, limit=100)

            return self.Delta_finite - (integral_real + 1j * integral_imag)
        except:
            # Fallback for numerical issues
            return self.Delta_finite

    def B22(self, q2, m1_2, m2_2):
        """
        Passarino-Veltman B22 function
        B₂₂(q²; m1², m2²) = ¼(Δ+1)[m1² + m2² - ⅓q²] - ½∫₀¹ dx X log(X - iε)
        """
        try:
            # Real part of the integral
            integral_real, _ = quad(lambda x: np.real(self.B22_integrand(x, q2, m1_2, m2_2)), 0, 1, limit=100)
            # Imaginary part of the integral
            integral_imag, _ = quad(lambda x: np.imag(self.B22_integrand(x, q2, m1_2, m2_2)), 0, 1, limit=100)

            first_term = 0.25 * (self.Delta_finite + 1) * (m1_2 + m2_2 - q2 / 3)
            integral = integral_real + 1j * integral_imag

            return first_term - 0.5 * integral
        except:
            # Fallback for numerical issues
            return 0.25 * (self.Delta_finite + 1) * (m1_2 + m2_2 - q2 / 3)

    def mathcal_B0(self, q2, m1_2, m2_2):
        """
        Finite B0 function: ℬ₀(q²; m1², m2²) = B₀(q²; m1², m2²) - B₀(0; m1², m2²)
        """
        return self.B0(q2, m1_2, m2_2) - self.B0(0, m1_2, m2_2)

    def mathcal_B22(self, q2, m1_2, m2_2):
        """
        Finite B22 function: ℬ₂₂(q²; m1², m2²) = B₂₂(q²; m1², m2²) - B₂₂(0; m1², m2²)
        """
        return self.B22(q2, m1_2, m2_2) - self.B22(0, m1_2, m2_2)

    def F_function(self, m1_2, m2_2):
        """
        F function: ℱ(m1², m2²) = ½(m1² + m2²) - (m1²m2²)/(m1² - m2²) log(m1²/m2²)
        """
        # Convert to numpy arrays for vectorized operations
        m1_2 = np.asarray(m1_2)
        m2_2 = np.asarray(m2_2)

        # Handle degenerate case where m1² ≈ m2²
        degenerate = np.abs(m1_2 - m2_2) < 1e-10
        result = np.zeros_like(m1_2 + m2_2)  # Create array with proper broadcasting

        # For degenerate cases, use L'Hôpital's rule: lim_{m2²→m1²} F(m1², m2²) = m1²
        result[degenerate] = m1_2[degenerate] if np.any(degenerate) else 0

        # For non-degenerate cases
        non_degenerate = ~degenerate
        if np.any(non_degenerate):
            m1_nd = m1_2[non_degenerate]
            m2_nd = m2_2[non_degenerate]

            # Avoid division by zero and log of negative numbers
            ratio = np.where(m2_nd > 0, m1_nd / m2_nd, 1.0)
            log_ratio = np.log(np.abs(ratio))

            result[non_degenerate] = 0.5 * (m1_nd + m2_nd) - (m1_nd * m2_nd) / (m1_nd - m2_nd) * log_ratio

        return result

    def mathcal_H(self, MV2, Mh, MH, cos_ba_2, sin_ba_2):
        """
        ℋ(M_V²) function used in S and U calculations
        """
        MV = np.sqrt(MV2)
        Mh_2 = Mh**2
        MH_2 = MH**2
        Mh_ref_2 = self.Mh_ref**2

        term1 = sin_ba_2 * (self.mathcal_B22(MV2, MV2, Mh_2) - MV2 * self.mathcal_B0(MV2, MV2, Mh_2))
        term2 = cos_ba_2 * (self.mathcal_B22(MV2, MV2, MH_2) - MV2 * self.mathcal_B0(MV2, MV2, MH_2))
        term3 = -(self.mathcal_B22(MV2, MV2, Mh_ref_2) - MV2 * self.mathcal_B0(MV2, MV2, Mh_ref_2))

        return (1 / (np.pi * MV2)) * (term1 + term2 + term3)

    def calculate_S(self, Mh, MH, MA, MHp, cos_ba, sin_ba):
        """
        Calculate S parameter
        """
        cos_ba_2 = cos_ba**2
        sin_ba_2 = sin_ba**2

        MZ2 = self.MZ**2
        Mh_2 = Mh**2
        MH_2 = MH**2
        MA_2 = MA**2
        MHp_2 = MHp**2
        Mh_ref_2 = self.Mh_ref**2

        # First line of S equation
        term1 = sin_ba_2 * (
            self.mathcal_B22(MZ2, MZ2, Mh_2)
            - MZ2 * self.mathcal_B0(MZ2, MZ2, Mh_2)
            + self.mathcal_B22(MZ2, MH_2, MA_2)
        )

        # Second line of S equation
        term2 = cos_ba_2 * (
            self.mathcal_B22(MZ2, MZ2, MH_2)
            - MZ2 * self.mathcal_B0(MZ2, MZ2, MH_2)
            + self.mathcal_B22(MZ2, Mh_2, MA_2)
        )

        # Third line of S equation
        term3 = (
            -self.mathcal_B22(MZ2, MHp_2, MHp_2)
            - self.mathcal_B22(MZ2, MZ2, Mh_ref_2)
            + MZ2 * self.mathcal_B0(MZ2, MZ2, Mh_ref_2)
        )

        return (1 / (np.pi * MZ2)) * (term1 + term2 + term3)

    def calculate_T(self, Mh, MH, MA, MHp, cos_ba, sin_ba):
        """
        Calculate T parameter
        """
        cos_ba_2 = cos_ba**2
        sin_ba_2 = sin_ba**2

        MW2 = self.MW**2
        MZ2 = self.MZ**2
        Mh_2 = Mh**2
        MH_2 = MH**2
        MA_2 = MA**2
        MHp_2 = MHp**2
        Mh_ref_2 = self.Mh_ref**2

        # First line of T equation
        term1 = sin_ba_2 * (
            self.F_function(MHp_2, MH_2)
            - self.F_function(MH_2, MA_2)
            + 3 * self.F_function(MZ2, Mh_2)
            - 3 * self.F_function(MW2, Mh_2)
        )

        # Second line of T equation
        term2 = cos_ba_2 * (
            self.F_function(MHp_2, Mh_2)
            - self.F_function(Mh_2, MA_2)
            + 3 * self.F_function(MZ2, MH_2)
            - 3 * self.F_function(MW2, MH_2)
        )

        # Third line of T equation
        term3 = self.F_function(MHp_2, MA_2) - 3 * self.F_function(MZ2, Mh_ref_2) + 3 * self.F_function(MW2, Mh_ref_2)

        return (1 / (16 * np.pi * MW2 * self.sw2)) * (term1 + term2 + term3)

    def calculate_U(self, Mh, MH, MA, MHp, cos_ba, sin_ba):
        """
        Calculate U parameter
        """
        cos_ba_2 = cos_ba**2
        sin_ba_2 = sin_ba**2

        MW2 = self.MW**2
        MZ2 = self.MZ**2
        Mh_2 = Mh**2
        MH_2 = MH**2
        MA_2 = MA**2
        MHp_2 = MHp**2

        # First line: ℋ(M_W²) - ℋ(M_Z²)
        H_MW = self.mathcal_H(MW2, Mh, MH, cos_ba_2, sin_ba_2)
        H_MZ = self.mathcal_H(MZ2, Mh, MH, cos_ba_2, sin_ba_2)
        term1 = H_MW - H_MZ

        # Second and third lines: W boson contributions
        term2 = (1 / (np.pi * MW2)) * (
            cos_ba_2 * self.mathcal_B22(MW2, MHp_2, Mh_2)
            + sin_ba_2 * self.mathcal_B22(MW2, MHp_2, MH_2)
            + self.mathcal_B22(MW2, MHp_2, MA_2)
            - 2 * self.mathcal_B22(MW2, MHp_2, MHp_2)
        )

        # Fourth and fifth lines: Z boson contributions
        term3 = -(1 / (np.pi * MZ2)) * (
            cos_ba_2 * self.mathcal_B22(MZ2, Mh_2, MA_2)
            + sin_ba_2 * self.mathcal_B22(MZ2, MH_2, MA_2)
            - self.mathcal_B22(MZ2, MHp_2, MHp_2)
        )

        return term1 + term2 + term3

    def calculate_STU(self, MHH, MHA, MHp, cba, lam5, sign_sba, input_file=None, output_file=None):
        """
        Override the parent method to use analytical calculations instead of SPheno.

        Parameters:
        -----------
        MHH : float
            Heavy Higgs mass
        MHA : float
            Pseudoscalar Higgs mass
        MHp : float
            Charged Higgs mass
        cba : float
            cos(beta-alpha) mixing parameter
        lam5 : float
            Lambda5 parameter
        sign_sba : int
            Sign of sin(beta-alpha): +1 or -1
        input_file : str, optional
            Not used in this implementation (kept for compatibility)
        output_file : str, optional
            Not used in this implementation (kept for compatibility)

        Returns:
        --------
        tuple : (S, T, U)
            STU parameters calculated analytically
        """
        try:
            # Get THDM parameters from input masses and mixing
            params = get_params_vectorized(MHH, MHA, MHp, cba, lam5, sign_sba, tb=10, vev=246.22, mhl=125.35)

            # Extract relevant parameters
            Mh = 125.35  # Light Higgs mass (SM-like)
            MH = MHH  # Heavy Higgs mass
            MA = MHA  # Pseudoscalar mass
            MHplus = MHp  # Charged Higgs mass

            # Get mixing angles
            cos_ba = params["cba"]
            sin_ba = params["sba"]

            # Calculate STU parameters
            S = self.calculate_S(Mh, MH, MA, MHplus, cos_ba, sin_ba)
            T = self.calculate_T(Mh, MH, MA, MHplus, cos_ba, sin_ba)
            U = self.calculate_U(Mh, MH, MA, MHplus, cos_ba, sin_ba)

            # Take real parts (imaginary parts should be negligible for physical parameters)
            S_real = np.real(S)
            T_real = np.real(T)
            U_real = np.real(U)

            return (S_real, T_real, U_real)

        except Exception as e:
            print(f"Error in analytical STU calculation: {str(e)}")
            return (None, None, None)
