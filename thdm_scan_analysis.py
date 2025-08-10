#!/usr/bin/env python3
"""
THDM Parameter Scan Analysis Script

This script performs a comprehensive analysis of Two Higgs Doublet Model (THDM) parameters,
including random sampling, vacuum stability checks, and visualization of constraints.

Based on the scan_THDM.ipynb notebook.
"""

import os
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from tqdm.auto import tqdm

# Import custom modules
from src.thdm_param_scan import calculate_random_sampling, check_vacuum_conditions


def setup_input_params():
    """Define input parameter descriptions."""
    input_params_keys = {
        "MHL": "lightest Higgs mass",
        "MHH": "heavy Higgs mass",
        "MHA": "pseudo-scalar Higgs mass",
        "MHp": "charged Higgs mass",
        "lam5": "Split..",
        "cba": "cos(beta-alpha)",
        "tb": "tan(beta)",
        "vev": "vacuum expectation value",
        "sign_sba": "sign(sin(beta-alpha))",
    }
    return input_params_keys


def define_scan_parameters():
    """Define the parameter ranges for the THDM scan."""
    higgs_mass = 125.35  # Higgs mass in GeV
    vev = 246.22  # Vacuum expectation value in GeV

    return {
        "higgs_mass": higgs_mass,
        "vev": vev,
        "mass_range": (6 * higgs_mass, 13 * higgs_mass),
        "epsilon_range": (-0.001, 0.001),
        "delta_range": (-0.25, 0.25),
        "n_points": int(1e7),
    }


def get_constraint_queries():
    """Define all the theoretical constraint queries."""
    queries = [
        "stability_lam1_positive",
        "stability_lam2_positive",
        "stability_lam1_2_condition",
        "stability_lam3_condition",
        "stability_lam4_condition",
        "stability_lam3_4_condition",
        "stability_lam1_2_3_4_condition",
        "global_minimum_condition",
        "unitarity_a_plus",
        "unitarity_a_minus",
        "unitarity_b_plus",
        "unitarity_b_minus",
        "unitarity_c_plus",
        "unitarity_c_minus",
        "unitarity_e_plus",
        "unitarity_e_minus",
        "unitarity_f_plus",
        "unitarity_f_minus",
        "unitarity_g_plus",
        "unitarity_g_minus",
        # "global_min_expression",
        "vacuum_stable",
        "unitarity_satisfied",
        "Theoretical_constraints_satisfied",
    ]
    return queries


def plot_query_results(results_with_conditions_a, f_query, output_dir):
    """
    Plot the results for a specific query constraint.

    Parameters:
    -----------
    results_with_conditions_a : pd.DataFrame
        DataFrame containing the THDM parameter scan results with constraints
    f_query : str
        Query string to filter the results
    output_dir : str
        Directory to save the output plots
    """
    # Filter and sample the results
    filtered_results = results_with_conditions_a.query(f_query)
    sample_size = int(min(2.5e4, len(filtered_results)))

    if len(filtered_results) == 0:
        print(f"Warning: No data points satisfy query '{f_query}'")
        return

    results_with_conditions = filtered_results.sample(sample_size, random_state=42)

    # Create the plot
    fig, axes = plt.subplots(2, 2, figsize=(12, 8))

    # Plot 1: MHH vs MHA colored by MHp
    scatter1 = axes[0, 0].scatter(
        results_with_conditions["MHH"],
        results_with_conditions["MHA"],
        c=results_with_conditions["MHp"],
        alpha=0.7,
        s=3,
        cmap="viridis",
    )
    axes[0, 0].set_xlabel("MHH [GeV]")
    axes[0, 0].set_ylabel("MHA [GeV]")
    axes[0, 0].set_title("MHH vs MHA (colored by MHp)")
    axes[0, 0].grid(True, alpha=0.3)
    cbar1 = plt.colorbar(scatter1, ax=axes[0, 0])
    cbar1.set_label("MHp [GeV]")

    # Plot 2: MHH vs MHp colored by MHA
    scatter2 = axes[0, 1].scatter(
        results_with_conditions["MHH"],
        results_with_conditions["MHp"],
        c=results_with_conditions["MHA"],
        alpha=0.7,
        s=3,
        cmap="plasma",
    )
    axes[0, 1].set_xlabel("MHH [GeV]")
    axes[0, 1].set_ylabel("MHp [GeV]")
    axes[0, 1].set_title("MHH vs MHp (colored by MHA)")
    axes[0, 1].grid(True, alpha=0.3)
    cbar2 = plt.colorbar(scatter2, ax=axes[0, 1])
    cbar2.set_label("MHA [GeV]")

    # Plot 3: MHA vs MHp colored by MHH
    scatter3 = axes[1, 0].scatter(
        results_with_conditions["MHA"],
        results_with_conditions["MHp"],
        c=results_with_conditions["MHH"],
        alpha=0.7,
        s=3,
        cmap="coolwarm",
    )
    axes[1, 0].set_xlabel("MHA [GeV]")
    axes[1, 0].set_ylabel("MHp [GeV]")
    axes[1, 0].set_title("MHA vs MHp (colored by MHH)")
    axes[1, 0].grid(True, alpha=0.3)
    cbar3 = plt.colorbar(scatter3, ax=axes[1, 0])
    cbar3.set_label("MHH [GeV]")

    # Plot 4: lam5 vs MHH colored by MHA
    scatter4 = axes[1, 1].scatter(
        results_with_conditions["lam5"],
        results_with_conditions["MHH"],
        c=results_with_conditions["MHA"],
        alpha=0.7,
        s=3,
        cmap="inferno",
    )
    axes[1, 1].set_xlabel("λ₅")
    axes[1, 1].set_ylabel("MHH [GeV]")
    axes[1, 1].set_title("λ₅ vs MHH (colored by MHA)")
    axes[1, 1].grid(True, alpha=0.3)
    cbar4 = plt.colorbar(scatter4, ax=axes[1, 1])
    cbar4.set_label("MHA [GeV]")

    plt.tight_layout()

    # Save the figure
    output_path = os.path.join(output_dir, f"{f_query}_THDM_param_scan_analysis.png")
    os.makedirs(output_dir, exist_ok=True)
    fig.savefig(output_path, dpi=100, bbox_inches="tight")

    # Close the figure to avoid displaying it and free memory
    plt.close(fig)

    # print(f"Figure saved successfully: {output_path}")


def plot_stu_constraint_comparison(results_with_conditions_b, output_dir):
    """
    Plot comparison between points that satisfy and don't satisfy STU constraints.

    Parameters:
    -----------
    results_with_conditions_b : pd.DataFrame
        DataFrame containing results with STU constraints
    output_dir : str
        Directory to save the output plots
    """
    # Filter results based on STU constraint
    results_with_conditions = results_with_conditions_b.query("Theoretical_constraints_satisfied")[: int(1e4)]
    results_with_conditions_and_stu = results_with_conditions.query("STU_constraint")
    results_without_stu = results_with_conditions.query("not STU_constraint")

    print(f"{len(results_with_conditions_and_stu)} points satisfy STU constraint")
    print(f"{len(results_without_stu)} points do not satisfy STU constraint")

    # Create the plot
    fig, axes = plt.subplots(2, 2, figsize=(12, 8))

    # Plot 1: MHH vs MHA colored by MHp
    axes[0, 0].scatter(
        results_without_stu["MHH"], results_without_stu["MHA"], c="cyan", alpha=0.3, s=1, label="No STU constraint"
    )
    scatter1 = axes[0, 0].scatter(
        results_with_conditions_and_stu["MHH"],
        results_with_conditions_and_stu["MHA"],
        c=results_with_conditions_and_stu["MHp"],
        alpha=0.7,
        s=3,
        cmap="viridis",
    )
    axes[0, 0].set_xlabel("MHH [GeV]")
    axes[0, 0].set_ylabel("MHA [GeV]")
    axes[0, 0].set_title("MHH vs MHA (colored by MHp)")
    axes[0, 0].grid(True, alpha=0.3)
    axes[0, 0].legend()
    cbar1 = plt.colorbar(scatter1, ax=axes[0, 0])
    cbar1.set_label("MHp [GeV]")

    # Plot 2: MHH vs MHp colored by MHA
    axes[0, 1].scatter(
        results_without_stu["MHH"], results_without_stu["MHp"], c="cyan", alpha=0.3, s=1, label="No STU constraint"
    )
    scatter2 = axes[0, 1].scatter(
        results_with_conditions_and_stu["MHH"],
        results_with_conditions_and_stu["MHp"],
        c=results_with_conditions_and_stu["MHA"],
        alpha=0.7,
        s=3,
        cmap="plasma",
    )
    axes[0, 1].set_xlabel("MHH [GeV]")
    axes[0, 1].set_ylabel("MHp [GeV]")
    axes[0, 1].set_title("MHH vs MHp (colored by MHA)")
    axes[0, 1].grid(True, alpha=0.3)
    axes[0, 1].legend()
    cbar2 = plt.colorbar(scatter2, ax=axes[0, 1])
    cbar2.set_label("MHA [GeV]")

    # Plot 3: MHA vs MHp colored by MHH
    axes[1, 0].scatter(
        results_without_stu["MHA"], results_without_stu["MHp"], c="cyan", alpha=0.3, s=1, label="No STU constraint"
    )
    scatter3 = axes[1, 0].scatter(
        results_with_conditions_and_stu["MHA"],
        results_with_conditions_and_stu["MHp"],
        c=results_with_conditions_and_stu["MHH"],
        alpha=0.7,
        s=3,
        cmap="coolwarm",
    )
    axes[1, 0].set_xlabel("MHA [GeV]")
    axes[1, 0].set_ylabel("MHp [GeV]")
    axes[1, 0].set_title("MHA vs MHp (colored by MHH)")
    axes[1, 0].grid(True, alpha=0.3)
    axes[1, 0].legend()
    cbar3 = plt.colorbar(scatter3, ax=axes[1, 0])
    cbar3.set_label("MHH [GeV]")

    # Plot 4: lam5 vs MHH colored by MHA
    axes[1, 1].scatter(
        results_without_stu["lam5"], results_without_stu["MHH"], c="cyan", alpha=0.3, s=1, label="No STU constraint"
    )
    scatter4 = axes[1, 1].scatter(
        results_with_conditions_and_stu["lam5"],
        results_with_conditions_and_stu["MHH"],
        c=results_with_conditions_and_stu["MHA"],
        alpha=0.7,
        s=3,
        cmap="inferno",
    )
    axes[1, 1].set_xlabel("λ₅")
    axes[1, 1].set_ylabel("MHH [GeV]")
    axes[1, 1].set_title("λ₅ vs MHH (colored by MHA)")
    axes[1, 1].grid(True, alpha=0.3)
    axes[1, 1].legend()
    cbar4 = plt.colorbar(scatter4, ax=axes[1, 1])
    cbar4.set_label("MHA [GeV]")

    plt.tight_layout()

    # Save the figure
    output_path = os.path.join(output_dir, "stu_THDM_param_scan_analysis.png")
    os.makedirs(output_dir, exist_ok=True)
    fig.savefig(output_path, dpi=150, bbox_inches="tight")

    # Close the figure
    plt.close(fig)

    print(f"STU constraint comparison plot saved: {output_path}")


def main():
    """Main function to run the THDM parameter scan analysis."""
    print("Starting THDM Parameter Scan Analysis...")

    # Setup parameters and directories
    input_params_keys = setup_input_params()
    scan_params = define_scan_parameters()
    queries = get_constraint_queries()
    current_folder = os.getcwd()
    # Define output directory
    output_dir = os.path.join(current_folder, "pdfs", "THDM", "scan_results")

    print(f"Parameter ranges:")
    print(f"  Higgs mass: {scan_params['higgs_mass']} GeV")
    print(f"  VEV: {scan_params['vev']} GeV")
    print(f"  Mass range: {scan_params['mass_range']}")
    print(f"  Epsilon range: {scan_params['epsilon_range']}")
    print(f"  Delta range: {scan_params['delta_range']}")
    print(f"  Number of points: {scan_params['n_points']}")

    # Step 1: Generate random sampling (if not already done)
    print("\n1. Generating random parameter sampling...")
    results_df = calculate_random_sampling(
        scan_params["mass_range"],
        scan_params["epsilon_range"],
        scan_params["delta_range"],
        n_samples=scan_params["n_points"],
        tb=1.0,
    )
    print(f"Generated {len(results_df)} parameter points")

    # Step 2: Check vacuum conditions
    print("\n2. Checking vacuum conditions...")
    results_with_conditions_a = check_vacuum_conditions(results_df, verbose=True)
    print(f"Results shape after vacuum conditions: {results_with_conditions_a.shape}")
    print(f"Available columns: {list(results_with_conditions_a.columns)}")

    # Step 3: Generate plots for all constraint queries
    print("\n3. Generating plots for all constraint queries...")
    # for query in tqdm(queries, desc="Processing constraint queries", unit="query"):
    #     try:
    #         plot_query_results(results_with_conditions_a, query, output_dir)
    #     except Exception as e:
    #         tqdm.write(f"    Error plotting {query}: {e}")

    # Step 4: Load pre-computed results with STU constraints (if available)
    data_file = "data/results_with_conditions.feather"
    if os.path.exists(data_file):
        print(f"\n4. Loading pre-computed results from {data_file}...")
        results_with_conditions_b = pd.read_feather(data_file)
        print(f"Loaded {len(results_with_conditions_b)} pre-computed results")

        # Step 5: Generate STU constraint comparison plot
        print("\n5. Generating STU constraint comparison plot...")
        plot_stu_constraint_comparison(results_with_conditions_b, output_dir)
    else:
        print(f"\n4. Warning: Pre-computed data file {data_file} not found. Skipping STU analysis.")

    print(f"\nAnalysis complete! All plots saved to: {output_dir}")


if __name__ == "__main__":
    main()
