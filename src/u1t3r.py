import numpy as np


def calculate_mass_params(m_f, m_F, theta_L):

    m_f2 = m_f**2
    m_F2 = m_F**2

    d_fF = m_f2 - m_F2
    s_fF = m_f2 + m_F2
    p_fF = m_f2 * m_F2

    c_2L = np.cos(2 * theta_L)
    s_2L = np.sin(2 * theta_L)

    # Calculate the fermion_free_params
    m_L2 = 0.5 * (s_fF - d_fF * abs(c_2L))
    m_R2 = (2 * p_fF * (s_fF + d_fF * abs(c_2L))) / (4 * p_fF * c_2L**2 + (s_fF) ** 2 * s_2L**2)
    m_chi2 = (
        (0.5 * s_2L**2)
        * (d_fF**2 * (s_fF + d_fF * abs(c_2L)))
        / (4 * p_fF * c_2L**2 + (s_fF) ** 2 * s_2L**2)
    )
    return np.sqrt(m_L2), np.sqrt(m_R2), np.sqrt(m_chi2)