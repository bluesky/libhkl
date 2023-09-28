#!/bin/bash

# Install required packages for building the hkl libraries.
# OS: Debian/ubuntu/...

DEBIAN_FRONTEND=noninteractive apt-get install -y  \
    apt-utils \
    autoconf \
    autoconf-archive \
    automake \
    build-essential \
    git \
    libhdf5-dev \
    libtool \
    m4 \
    make \
    pkg-config

# These will be installed later.  The OS version
# controls which versions are installed.
    # gobject-introspection=1.66.1-1+b1 \
    # libgsl-dev=2.6+dfsg-2 \
    # libcglm-dev \
    # libgirepository1.0-dev \
    # libglib2.0-dev \

# apt-cache show libgsl-dev | grep Version
