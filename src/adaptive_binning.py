"""
Adaptive binning utilities for histogram analysis.

This module provides functions to create adaptive bin edges based on sample data
and weights, ensuring that each bin meets statistical significance requirements.
"""

import numpy as np
from ROOT import TH1F
import uuid


def adaptive_bin_edges(
    samples: np.ndarray, weights: np.ndarray, x_min: float, bin_width: float = 10, max_rel_error: float = 0.20
) -> np.ndarray:
    """
    Create adaptive bin edges based on relative error threshold.

    This function creates bin edges by combining adjacent bins until each bin
    meets the specified relative error threshold.

    Parameters
    ----------
    samples : np.ndarray
        Array of sample values to be binned
    weights : np.ndarray
        Array of weights corresponding to each sample
    x_min : float
        Minimum value for binning range
    bin_width : float, optional
        Initial bin width for uniform binning, by default 10
    max_rel_error : float, optional
        Maximum allowed relative error (sqrt(sum_w2)/sum_w) for each bin, by default 0.20

    Returns
    -------
    np.ndarray
        Array of adaptive bin edges
    """
    x_max = np.max(samples) if np.max(samples) > x_min else x_min + bin_width

    x_max = x_min + np.ceil((x_max - x_min) / bin_width) * bin_width
    bin_edges = np.arange(x_min, x_max + bin_width, bin_width)
    indices = np.digitize(samples, bin_edges) - 1
    n_bins = len(bin_edges) - 1

    # Vectorized version using np.bincount
    valid_mask = (indices >= 0) & (indices < n_bins)
    valid_indices = indices[valid_mask]
    valid_weights = weights[valid_mask]

    sum_w = np.bincount(valid_indices, weights=valid_weights, minlength=n_bins)
    sum_w2 = np.bincount(valid_indices, weights=valid_weights**2, minlength=n_bins)

    new_edges = [x_min]
    i = 0
    while i < n_bins:
        total_w = sum_w[i]
        total_w2 = sum_w2[i]
        j = i
        while (total_w == 0 or np.sqrt(total_w2) / total_w > max_rel_error) and (j + 1 < n_bins):
            j += 1
            total_w += sum_w[j]
            total_w2 += sum_w2[j]

        # Si estamos en los últimos bins y no se cumple la condición, extender hasta x_max
        if j + 1 >= n_bins and (total_w == 0 or np.sqrt(total_w2) / total_w > max_rel_error):
            # Agregar todos los bins restantes hasta x_max
            remaining_w = np.sum(sum_w[i:])
            remaining_w2 = np.sum(sum_w2[i:])
            if remaining_w > 0 and np.sqrt(remaining_w2) / remaining_w <= max_rel_error:
                new_edges.append(x_max)
                break
            else:
                # Si incluso agregando todos los bins restantes no se cumple, usar x_max
                new_edges.append(x_max)
                break
        else:
            new_edges.append(bin_edges[j + 1])
            i = j + 1
    if new_edges[-1] < x_max:
        new_edges[-1] = x_max
    return np.array(new_edges)


def adaptive_bin_edges_v2(
    samples: np.ndarray, weights: np.ndarray, x_min: float, bin_width: float = 10, max_rel_error: float = 0.20
) -> np.ndarray:
    """
    Create adaptive bin edges with improved ROOT histogram-based validation.

    This function creates bin edges by first using the basic adaptive_bin_edges function
    and then refining the edges by validating relative errors using ROOT histograms.
    This provides more accurate error calculations for each bin.

    Parameters
    ----------
    samples : np.ndarray
        Array of sample values to be binned
    weights : np.ndarray
        Array of weights corresponding to each sample
    x_min : float
        Minimum value for binning range
    bin_width : float, optional
        Initial bin width for uniform binning, by default 10
    max_rel_error : float, optional
        Maximum allowed relative error for each bin, by default 0.20

    Returns
    -------
    np.ndarray
        Array of refined adaptive bin edges
    """
    x_max = np.max(samples) if np.max(samples) > x_min else x_min + bin_width

    x_max = x_min + np.ceil((x_max - x_min) / bin_width) * bin_width

    initial_bin_edges = adaptive_bin_edges(samples, weights, x_min, bin_width, max_rel_error)

    final_bin_edges = [x_min]
    i = 0
    while i < len(initial_bin_edges) - 1:
        j = 0  # number of bins to merge
        while i + j + 1 < len(initial_bin_edges):
            j += 1
            in_edge = initial_bin_edges[i]
            out_edge = initial_bin_edges[i + j]

            bin_data = samples[(samples >= in_edge) & (samples < out_edge)]
            bin_weights = weights[(samples >= in_edge) & (samples < out_edge)] / (out_edge - in_edge)
            if len(bin_data) == 0:
                pass
            else:
                temp_hist = TH1F(f"temp_hist_{uuid.uuid4()}", "Temporary Histogram", 1, in_edge, out_edge)
                temp_hist.SetDirectory(0)  # Avoid ROOT directory issues
                temp_hist.FillN(len(bin_data), bin_data, bin_weights)

                rel_error = (
                    temp_hist.GetBinError(1) / temp_hist.GetBinContent(1) if temp_hist.GetBinContent(1) > 0 else 1
                )
                if rel_error <= max_rel_error:
                    final_bin_edges.append(out_edge)
                    break

        # If we couldn't find a suitable combination, just use the next edge
        if j == 0 or i + j >= len(initial_bin_edges):
            if i + 1 < len(initial_bin_edges):
                final_bin_edges.append(initial_bin_edges[i + 1])
            i += 1
        else:
            i += j

    if final_bin_edges[-1] < x_max:
        final_bin_edges[-1] = x_max
    return np.array(final_bin_edges)
