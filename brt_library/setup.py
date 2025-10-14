"""
Setup script for the DiTaus BRT Library.
"""

from setuptools import setup, find_packages
import os

# Read README for long description
with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

# Read requirements
with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="ditaus-brt",
    version="1.0.0",
    author="Phenomenology Group - Universidad de los Andes",
    author_email="",
    description="A portable library for predicting ditau masses using BRT models",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Science/Research",
        "Topic :: Scientific/Engineering :: Physics",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
    install_requires=requirements,
    include_package_data=True,
    package_data={
        "ditaus_brt": ["models/*.pkl"],
    },
    zip_safe=False,
    keywords="physics machine-learning tau particles boosted-regression-trees",
    project_urls={
        "Source": "https://github.com/Phenomenology-group-uniandes/ditaus_analysis",
    },
)
