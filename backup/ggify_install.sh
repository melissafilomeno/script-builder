#!/bin/bash

# go to llama.cpp directory
cd <path_to_llama>

# update pip3
/usr/local/bin/pip3 install --upgrade pip

# install requirements.txt
/usr/local/bin/pip3 install -e .

# clone git repository
git clone https://github.com/akx/ggify.git

# =========== WIP ===========
/usr/local/bin/python3 ggify.py stabilityai/stable-diffusion-xl-refiner-1.0/vae_1_0 --llama-cpp-dir <path_to_llama>
