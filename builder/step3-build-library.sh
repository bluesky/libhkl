#!/bin/bash

# custom build script to build the hkl library

set -e

pushd hkl || exit
echo "Checkout branch: ${HKL_TAG}"
git config pull.rebase true
git fetch
git fetch
git checkout "${HKL_TAG}"
git pull

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
    --disable-binoculars \
    --disable-gui \
    --disable-hkl-doc \
    --enable-introspection=yes \
    --prefix="${PREFIX}"

make -j "${CPU_COUNT:-1}"
make install
popd || exit
