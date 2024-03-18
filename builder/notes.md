# README

Build the hkl library for use in hklpy.

Additional background on the reasons for the build process used at this time is documented in:

- https://github.com/bluesky/hklpy/issues/250
- https://github.com/conda-forge/hkl-feedstock/pull/13

## Install Miniconda

```bash
apt install wget
wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -q \
    -O miniconda.sh
bash miniconda.sh -b -p /opt/miniconda
source /opt/miniconda/bin/activate
conda install -y gobject-introspection pygobject -c conda-forge
```

## Tell Python about the library

```bash
pushd /opt/hkl/
tar cf - * | (cd $CONDA_PREFIX/ && tar xf -)
popd
```

## Test

Test by import the library into python.  Then try a couple things.

```py
# gobject-introspection, to access libhkl
import gi

gi.require_version("Hkl", "5.0")
from gi.repository import Hkl as libhkl
from gi.repository import GLib  # noqa: F401

# access some content
diffractometer_types = tuple(sorted(libhkl.factories().keys()))
assert isinstance(diffractometer_types, list)
assert 5 < len(diffractometer_types) < 20

UserUnits = libhkl.UnitEnum.USER
assert UserUnits is not None

DefaultUnits = libhkl.UnitEnum.DEFAULT
assert DefaultUnits is not None
```

## Further testing

Make a tar.gz file for installation into a conda environment.  All content one
level below the `hkl/` directory.

```bash
cd /opt/hkl
tar czf /tmp/hkl-3357.tar.gz include/ lib/ share/
```

On a clean workstation (new docker container), install miniconda and the
gobject-introspection & pygobject packages, then unzip the hkl-3357.tar.gz file
into `$CONDA_PREFIX/`.

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

Debian GNU/Linux 12 (bookworm)
    apt-cache show libgsl-dev | grep Version
        Version: 2.7.1+dfsg-5       # <---- not on conda-forge!

GitHub Actions workflow: ubuntu-20.04
NAME="Ubuntu"
VERSION="20.04.6 LTS (Focal Fossa)"
    apt-cache show gobject-introspection | grep Version
        Version: 1.64.1-1~ubuntu20.04.1
        Version: 1.64.0-2
    apt-cache show libgsl-dev | grep Version
        Version: 2.5+dfsg-6build1

debian:bullseye
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
    apt-cache show gobject-introspection | grep Version
        Version: 1.66.1-1+b1
    apt-cache show libgsl-dev | grep Version
        Version: 2.6+dfsg-2

GitHub Actions workflow: ubuntu-latest, ubuntu-22.04
PRETTY_NAME="Ubuntu 22.04.3 LTS"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
    apt-cache show gobject-introspection | grep Version
        Version: 1.72.0-1
    apt-cache show libgsl-dev | grep Version
        Version: 2.7.1+dfsg-3       # <---- not on conda-forge!

NOTES:

- GitHub Actions workflows only run on ubuntu-20.04, or ubuntu-22.04 (latest).
- hkl v5.0.0.3357 requires package libcglm-dev, only available in ubuntu-22.04!
- Can build libhkl-v5.0.0.3357 but cannot create conda-forge package, until
  package gsl=2.7.1 becomes available.
- Now, since gsl & gobject-introspection are built locally from source, could
  possibly build the libhkl tarball with appropriate HKL_TAG in a GHA workflow.
  Maybe later.  This works now.
- 2024-03: Encountered problems building gobject-introspection now.

  1. `meson` reports missing Python package `packaging`: install by pip.
  2. Then, this error from `meson setup`:

        gir/meson.build:155:22: ERROR: Requested variable "glib_unix_h" not found.

     Web search turned up zero reports about this line.  Ultimately, commented
     this line, and surrounding `if` block.  Compilation of entire project
     completed.

        cat >> "${HOME}/patch_glib2"  << EOF
        153,157c153,157
        <   if giounix_dep.found()
        <     glib_files += [
        <       glib_subproject.get_variable('glib_unix_h')
        <     ]
        <   endif
        ---
        >   # if giounix_dep.found()
        >   #   glib_files += [
        >   #     glib_subproject.get_variable('glib_unix_h')
        >   #   ]
        >   # endif
        EOF
        patch ./gir/meson.build "${HOME}/patch_glib2"
