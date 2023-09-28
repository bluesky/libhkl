#!/bin/bash

# local builds of certain support libraries
# gobject-introspection
# gsl (Gnu Scientific Library)

export GOBJECT_INTROSPECTION_REPO=https://gitlab.gnome.org/GNOME/gobject-introspection.git
export GSL_REPO=https://git.savannah.gnu.org/git/gsl.git

#####################################
##################################### prerequisites
#####################################


# https://gi.readthedocs.io/en/latest/build_test.html
# as the docs say ...
apt-get install -y \
    pkg-config\
    python3-dev flex bison libglib2.0-dev \
    libcairo2-dev libffi-dev python3-mako \
    python3-markdown python3-distutils meson build-essential \
    gtk-doc-tools

#####################################
##################################### gsl
#####################################

git clone "${GSL_REPO}"
pushd gsl
git checkout "${GSL_TAG}"

bash autogen.sh
./configure --prefix /usr && make && make install
popd

#####################################
##################################### gobject-introspection
#####################################

git clone "${GOBJECT_INTROSPECTION_REPO}"
pushd gobject-introspection
git checkout "${GOBJECT_INTROSPECTION_TAG}"

# meson setup _build
# FIXME: This failed
#
# root@f468fa3b3778:/opt/gobject-introspection# !meson
# meson setup _build
# The Meson build system
# Version: 0.56.2
# Source dir: /opt/gobject-introspection
# Build dir: /opt/gobject-introspection/_build
# Build type: native build

# meson.build:1:0: ERROR: Meson version is 0.56.2 but project requires >= 0.60.0

# A full log can be found at /opt/gobject-introspection/_build/meson-logs/meson-log.txt

# meson is Python code, install a newer version from PyPI via pip
# First, need pip
meson --version  # 0.56.2
apt-get install -y python3-pip
python3 -m pip install -U meson
meson --version  # 1.2.1 (on 2093-09-26)

meson setup _build --prefix=/usr
cd _build
meson configure | cat  # optional, show this information
meson compile
meson test
meson install

which g-ir-scanner
# /usr/bin/g-ir-scanner
# export LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu/
g-ir-scanner --version
# g-ir-scanner 1.78.1
popd

