#!/bin/bash

export CONDA_DIR=${CONDA_DIR:-/opt/conda}
export CONDA_PREFIX=${CONDA_PREFIX:-/opt/conda}
echo CONDA_DIR="${CONDA_DIR}"
echo CONDA_PREFIX="${CONDA_PREFIX}"

source $CONDA_DIR/etc/profile.d/conda.sh
tar xzf /home/libhkl.tar.gz -C $CONDA_PREFIX
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
