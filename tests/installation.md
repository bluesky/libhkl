# Install custom libhkl

Start in a conda environment

- bash command: `echo CONDA_PREFIX=$CONDA_PREFIX`
- output: `CONDA_PREFIX=/home/prjemian/.conda/envs/bluesky_2024_1`

with hklpy (and libhkl) already installed.

- bash command: `python -c "import hkl; print(hkl.__version__)"`
- output: `1.1.0`

You'll need all four download files in the same directory.

file | description
---- | ----
`libhkl.tar.gz` | compiled libhkl library
`__init__.patch` | updates for hklpy
`calc.patch` | updates for hklpy
`geometries.patch` | updates for hklpy

## Verify new libhkl not installed (yet)

Print out libhkl (HKL) version and available geometries:

```bash
echo "before installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"
```

### Output

Note that `'APS POLAR'` is not in this list.

```bash
VERSION: #define HKL_VERSION "v5.0.0.3357"
['E4CH', 'E4CV', 'E6C', 'K4CV', 'K6C', 'PETRA3 P09 EH2', 'PETRA3 P23 4C', 'PETRA3 P23 6C', 'SOLEIL MARS', 'SOLEIL NANOSCOPIUM ROBOT', 'SOLEIL SIRIUS KAPPA', 'SOLEIL SIRIUS TURRET', 'SOLEIL SIXS MED1+2', 'SOLEIL SIXS MED2+2', 'SOLEIL SIXS MED2+3', 'SOLEIL SIXS MED2+3 v2', 'TwoC', 'ZAXIS']
```

## Replace the libhkl library

Install from the compressed TAR file: `libhkl.tar.gz`

```bash
tar xzf libhkl.tar.gz  -C $CONDA_PREFIX
```

## Verify libhkl has been installed successfully

Print out libhkl (HKL) version and available geometries:

```bash
echo "after installing custom library"
echo "VERSION: $(grep VERSION $CONDA_PREFIX/include/hkl-5/hkl.h)"
python -c "from hkl.util import libhkl; print(sorted(libhkl.factories().keys()))"
```

### Output

Note the version is different and that `'APS POLAR'` has been added to the list.

```bash
VERSION: #define HKL_VERSION "polar-v2"
['APS POLAR', 'E4CH', 'E4CV', 'E6C', 'ESRF ID01 PSIC', 'K4CV', 'K6C', 'PETRA3 P09 EH2', 'PETRA3 P23 4C', 'PETRA3 P23 6C', 'SOLEIL MARS', 'SOLEIL NANOSCOPIUM ROBOT', 'SOLEIL SIRIUS KAPPA', 'SOLEIL SIRIUS TURRET', 'SOLEIL SIXS MED1+2', 'SOLEIL SIXS MED2+2', 'SOLEIL SIXS MED2+3', 'SOLEIL SIXS MED2+3 v2', 'TwoC', 'ZAXIS']
```

## update hklpy with APS POLAR

```bash
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/__init__.py __init__.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/calc.py calc.patch
patch $CONDA_PREFIX/lib/python3.1/site-packages/hkl/geometries.py geometries.patch
```

## test APS POLAR geometry in hklpy

```bash
echo "SimulatedApsPolar in hklpy"
python -c "from hkl import SimulatedApsPolar; polar = SimulatedApsPolar('', name='polar'); polar.wh()"
```

### Output

```bash
===================== ================================= =========
term                  value                             axis_type
===================== ================================= =========
diffractometer        polar                                      
sample name           main                                       
energy (keV)          8.05092                                    
wavelength (angstrom) 1.54000                                    
calc engine           hkl                                        
mode                  4-circles constant phi horizontal          
h                     0.0                               pseudo   
k                     0.0                               pseudo   
l                     0.0                               pseudo   
tau                   0                                 real     
mu                    0                                 real     
chi                   0                                 real     
phi                   0                                 real     
gamma                 0                                 real     
delta                 0                                 real     
===================== ================================= =========
```
