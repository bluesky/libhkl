# libhkl

Build the [*hkl*](https://repo.or.cz/hkl.git) C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

GH tag | GH release | conda-forge | License
--- | --- | --- | ---
[![tag](https://img.shields.io/github/tag/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/tags) | [![release](https://img.shields.io/github/release/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/releases) | [![conda-forge](https://img.shields.io/conda/vn/conda-forge/hkl)](https://anaconda.org/conda-forge/hkl) | [![license: GPLv3](https://img.shields.io/badge/license-GPLv3-brightgreen)](/COPYING)

* [project details](./docs/README.md)

This repository is for **hklpy** *developers*. Diffractometer *users* are
referred to [*hklpy*](https://blueskyproject.io/hklpy/) for guidance with
the [Bluesky Framework](https://blueskyproject.io).

## Overview

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
