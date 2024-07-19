#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate hklpy

echo "before installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python /home/try_hklpy.py

# install the custom library
bash /home/install-libhkl.sh

echo "after installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python /home/try_hklpy.py
