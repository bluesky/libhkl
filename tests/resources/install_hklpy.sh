#!/bin/bash

source /opt/conda/etc/profile.d/conda.sh
conda activate hklpy
# python -c "from hkl import SimulatedE4CV; e4cv = SimulatedE4CV('', name='e4cv'); e4cv.wh()"
# python -c "from hkl.geometries import __all__; print(__all__)"

echo "before installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"

# install the custom library
tar xzf /home/libhkl.tar.gz -C $CONDA_PREFIX

echo "after installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"

# add support for APS POLAR to hklpy
conda install -y ipython nano patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/__init__.py /home/__init__.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/calc.py /home/calc.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/geometries.py /home/geometries.patch

echo "SimulatedApsPolar in hklpy"
python -c "from hkl import SimulatedApsPolar; polar = SimulatedApsPolar('', name='polar'); polar.wh()"
