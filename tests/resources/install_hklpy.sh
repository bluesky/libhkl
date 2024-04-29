#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate hklpy
# python -c "from hkl import SimulatedE4CV; e4cv = SimulatedE4CV('', name='e4cv'); e4cv.wh()"
# python -c "from hkl.geometries import __all__; print(__all__)"

# as learned in https://github.com/bluesky/libhkl/issues/13
conda env config vars set LD_LIBRARY_PATH=$CONDA_PREFIX/lib

echo "before installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"

# install the custom library
export DOWNLOADS=/home
tar xzf $DOWNLOADS/libhkl.tar.gz -C $CONDA_PREFIX

echo "after installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"

# add support for APS POLAR to hklpy
conda install -y ipython nano patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/__init__.py $DOWNLOADS/__init__.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/calc.py $DOWNLOADS/calc.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/geometries.py $DOWNLOADS/geometries.patch

echo "SimulatedApsPolar in hklpy"
python -c "from hkl import SimulatedApsPolar; polar = SimulatedApsPolar('', name='polar'); polar.wh()"
