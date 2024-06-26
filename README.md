# libhkl

Build the [*hkl*](https://repo.or.cz/hkl.git) C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

GH tag | GH release | conda-forge | License
--- | --- | --- | ---
[![tag](https://img.shields.io/github/tag/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/tags) | [![release](https://img.shields.io/github/release/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/releases) | [![conda-forge](https://img.shields.io/conda/vn/conda-forge/hkl)](https://anaconda.org/conda-forge/hkl) | [![license: GPLv3](https://img.shields.io/badge/license-GPLv3-brightgreen)](/COPYING)

NOTE: This repository is for hklpy developers and is not of general interest to
Bluesky users.

See additional information for how these [tarball
files](https://en.wikipedia.org/wiki/Tar_(computing)) are
[built](./builder/README.md) and [tested](./tests/README.md).

The *libhkl* tarball file depends on specific versions of both
[*gsl*](https://www.gnu.org/software/gsl/) and
[*gobject-introspection*](https://gi.readthedocs.io/en/latest/).

**Contents**

- [libhkl](#libhkl)
  - [Project maintainers](#project-maintainers)
  - [tarball files](#tarball-files)
    - [libhkl-v5.0.0.3434-x86\_64.tar.gz](#libhkl-v5003434-x86_64targz)
    - [Releases](#releases)

## Project maintainers

The maintainers of this project are listed [here](./MAINTAINERS.md).

## tarball files

### libhkl-v5.0.0.3434-x86_64.tar.gz

package | version
--- | ---
sha256 | `8565ac5c45d37f9062681ed74b218e0c85360d82e4240d1c7e9af998f0b64147`
built on | [Docker](https://github.com/bluesky/libhkl/tree/main/builder)
architecture | x86_64
OS | debian:bullseye
`gobject-introspection` | 1.78.1 (built from source)
`libgsl-dev` | 2.7 (built from source)

Packaging requirements to build a conda-forge package with this library:

```text
    gobject-introspection =1.78.1
    gsl =2.7
    pygobject
    python >=3.8,<3.13
```

### Releases

See release details for more information.

release | tarball
--- | ---
[v1.2.1](https://github.com/bluesky/libhkl/releases/tag/v1.2.1) | `libhkl-v5.0.0.3434-x86_64.tar.gz`
[v1.2.0](https://github.com/bluesky/libhkl/releases/tag/v1.2.0) | `libhkl-v5.0.0.3357-x86_64.tar.gz`
[v1.1.0](https://github.com/bluesky/libhkl/releases/tag/v1.1.0) | `libhkl-v5.0.0.3001-x86_64.tar.gz`
[v1.0.0](https://github.com/bluesky/libhkl/releases/tag/v1.0.0) | `libhkl-v5.0.0.2173-x86_64.tar.gz`
