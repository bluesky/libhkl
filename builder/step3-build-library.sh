#!/bin/bash

# custom build script to build the hkl library

set -e
pushd hkl

apt-get install -y libcglm-dev

# add version info
sed -i '/^.*tau = 2pi.*/i #define HKL_VERSION "'"${HKL_TAG}"'"' hkl.h

# don't build the documentation
# sed removes any lines containing the described text
sed -i '/gtk-doc/d' ./configure.ac
sed -i '/GTK_DOC_CHECK/d' ./configure.ac
sed -i '/Documentation/d' ./configure.ac

test -d m4 || mkdir m4

aclocal --print-ac-dir
# export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}"
# export PKG_CONFIG_PATH="/usr/local/lib/x86_64-linux-gnu/pkgconfig:${PKG_CONFIG_PATH}"
autoreconf -ivf

./configure \
    --disable-static \
    --disable-gui \
    --disable-hkl-doc \
    --enable-introspection=yes \
    --prefix="${PREFIX}"

make -j ${CPU_COUNT}
make install
popd
