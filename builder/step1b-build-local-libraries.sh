#!/bin/bash

set -e pipefail

# local builds of certain support libraries
# gobject-introspection
# gsl (Gnu Scientific Library)
# inih (INI Not Invented Here)
# cglm (Highly Optimized 2D / 3D Graphics Math (glm) for C)

export CGLM_REPO=https://github.com/recp/cglm
export GOBJECT_INTROSPECTION_REPO=https://gitlab.gnome.org/GNOME/gobject-introspection.git
export GSL_REPO=https://git.savannah.gnu.org/git/gsl.git
export INIH_REPO=https://github.com/benhoyt/inih.git

#####################################
##################################### prerequisites
#####################################

cat >> "${HOME}/.bashrc"  << EOF
#
# add some helpful shell aliases
alias l='ls -CF --color=auto '
alias la='ls -A --color=auto '
alias ll='ls -lAFh --color=auto '
alias ls='ls --color=auto '
alias mv='mv -i'
alias rm='rm -i '
EOF


# https://gi.readthedocs.io/en/latest/build_test.html
# as the docs say ...
apt-get install -y \
    pkg-config \
    python3-dev flex bison libglib2.0-dev \
    libcairo2-dev libffi-dev python3-mako \
    python3-markdown python3-distutils meson build-essential \
    gtk-doc-tools

#####################################
##################################### gsl
#####################################

git clone "${GSL_REPO}"
pushd gsl || exit
git checkout "${GSL_TAG}"

bash autogen.sh
./configure --prefix /usr && make && make install
popd || exit

#####################################
##################################### gobject-introspection
#####################################

git clone "${GOBJECT_INTROSPECTION_REPO}"
pushd gobject-introspection || exit
git checkout "${GOBJECT_INTROSPECTION_TAG}"

# meson is Python code, install a newer version from PyPI via pip
# First, need pip
meson --version  # 0.56.2
apt-get install -y python3-pip
python3 -m pip install -U "meson==1.2.1" packaging
meson --version  # 1.2.1 (on 2093-09-26)

# gir/meson.build:155:22: ERROR: Requested variable "glib_unix_h" not found.
# FIX: Comment out the code lines around this statement!
# root@b0b5d797a6ee:/tmp# diff /tmp/gobject-introspection/gir/meson.build /home/gobject-introspection/gir/meson.build 
cat > "${HOME}/patch_glib2"  << EOF
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

meson setup _build --prefix=/usr
cd _build || exit
meson configure | cat  # optional, show this information
meson compile
meson test
meson install

which g-ir-scanner
# /usr/bin/g-ir-scanner
# export LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu/
g-ir-scanner --version
# g-ir-scanner 1.78.1
popd || exit


#####################################
##################################### inih
#####################################

git clone "${INIH_REPO}"
pushd inih || exit
git checkout "${INIH_TAG}"

meson setup _build --prefix=/usr
cd _build || exit
meson configure | cat  # optional, show this information
meson compile
meson test
meson install
popd || exit


#####################################
##################################### cglm
#####################################

git clone "${CGLM_REPO}"
pushd cglm || exit
git checkout "${CGLM_TAG}"

meson setup _build --prefix=/usr
cd _build || exit
meson configure | cat  # optional, show this information
meson compile
meson test
meson install
popd || exit
