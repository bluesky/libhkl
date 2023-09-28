#!/bin/bash

# conda activate hkl
tar xzf /home/libhkl.tar.gz -C /opt/conda
echo "VERSION: $(grep VERSION /opt/conda/include/hkl-5/hkl.h)"
