# libhkl

Build the [*hkl*](https://repo.or.cz/hkl.git) C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

GH tag | GH release | conda-forge | License
--- | --- | --- | ---
[![tag](https://img.shields.io/github/tag/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/tags) | [![release](https://img.shields.io/github/release/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/releases) | [![conda-forge](https://img.shields.io/conda/vn/conda-forge/hkl)](https://anaconda.org/conda-forge/hkl) | [![license: GPLv3](https://img.shields.io/badge/license-GPLv3-brightgreen)](/COPYING)

This repository is for **hklpy** *developers*, to build a new version of the
`libhkl.so` library used by [*hklpy*](https://blueskyproject.io/hklpy/) for
diffractometer calculations and operations within the [Bluesky
Framework](https://blueskyproject.io).  For more details, see the project
[documentation](./docs/README.md).

## Overview

1. Build `libhkl.tar.gz` from source using a [docker VM](./builder/Dockerfile).
1. Test `libhkl.tar.gz` with conda using a [docker VM](./tests/Dockerfile).
