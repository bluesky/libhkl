# README

Build the hkl library for use in hklpy.

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

Additional background on the reasons for the build process used at this time is documented in:

- https://github.com/bluesky/hklpy/issues/250
- https://github.com/conda-forge/hkl-feedstock/pull/13

Make a libhkl.tar.gz file for installation into a conda environment.
Unpack the libhkl.tar.gz file into `$CONDA_PREFIX/`.

Might need to control the version of various libraries installed when building
the `libhkl` C code.

To control the software versions, need to coordinate between the linux build and
the Python conda install.  The linux packages available for installation via
`apt` are controlled by the debian/ubuntu version.  See the version(s)
available:

    apt-cache show PACKAGE | grep Version

or install from source.

The Linux version is:

    more /etc/os-release

Need to coordinate equivalent versions with those available on conda-forge.
<https://anaconda.org/conda-forge/PACKAGE/files>

anaconda.org/conda-forge/gobject-introspection/files
    1.78.0, 1.76.1, 1.74.0, 1.72.0, 1.70.0, 1.68.0, 1.66.1, 1.66.0, 1.64.1
anaconda.org/conda-forge/gsl/files
    2.7, 2.6, 2.5, 2.4, 2.2.1

## gobject-introspection

Build gobject-introspection and gsl from source.

gobject-introspection version | Python version
--- | ---
1.64.1 | py36 - py38
1.66.1 | py36 - py39
1.72.0 | py37 - py310
1.78.1 | py38 - py311
