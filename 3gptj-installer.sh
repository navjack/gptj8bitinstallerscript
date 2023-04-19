#!/bin/bash

# create and activate the conda environment
conda create -y -n gptj python=3.8
conda activate gptj

# install PyTorch with CUDA support
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.6 -c pytorch -c nvidia

# install the GPT-J model from the specified GitHub repository
pip uninstall -y transformers
pip install --no-cache-dir https://github.com/deniskamazur/transformers/archive/gpt-j-8bit.zip

# install the bitsandbytes library with CUDA support
pip install bitsandbytes-cuda111

# install the datasets library version 1.16.1
pip install datasets==1.16.1
exit