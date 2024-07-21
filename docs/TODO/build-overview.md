# Build Overview

Create a VM in docker to build Hkl.

- based on debian:latest
- apt install gobject-introspection libglib2.0-dev libgsl27 libgsl-dev and other packages
- no conda installed here
- git clone https://repo.or.cz/hkl.git
- build libhkl.so
- create tarball libhkl.tar.gz
- copy tarball from build VM to host

Create a second VM in docker to test libhkl.so.  
This VM is separate from the build VM.

- based on condaforge/mambaforge
- includes tarball libhkl.tar.gz
- no Hkl source code installed here
- conda install gobject-introspection gsl libcblas pygobject
- unpack tarball libhkl.tar.gz into conda environment
- export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
- test with python
