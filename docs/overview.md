# Overview of the Design

This repository defines two virtual machine images (via Dockerfiles).  The
`builder` VM creates `libhkl.tar.gz` from the Hkl
[source](https://repo.or.cz/hkl.git).  The `tests` VM tests that the `hklpy`
package can be used with the new `libhkl.tar.gz`.

## Steps

Here are the steps (overview, not exact commands)

1. Create a VM in docker to build Hkl.

   - based on debian:11 (for libgsl.so.25)
   - apt install gobject-introspection libgsl-dev and other packages
   - no conda installed here
   - git clone https://repo.or.cz/hkl.git
   - build libhkl.so
   - create tarball libhkl.tar.gz


2. Create a second VM in docker to test libhkl.so.  This VM is separate from the build VM.

   - copy tarball from build VM to host
   - based on condaforge/mambaforge
   - includes tarball libhkl.tar.gz
   - no Hkl source code installed here
   - conda install gobject-introspection gsl libcblas pygobject
   - unpack tarball libhkl.tar.gz into conda environment
   - export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
   - test with python
