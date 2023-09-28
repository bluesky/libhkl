# libhkl

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

GH tag | GH release | conda-forge | License
--- | --- | --- | ---
[![tag](https://img.shields.io/github/tag/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/tags) | [![release](https://img.shields.io/github/release/bluesky/libhkl.svg)](https://github.com/bluesky/libhkl/releases) | [![conda-forge](https://img.shields.io/conda/vn/conda-forge/hkl)](https://anaconda.org/conda-forge/hkl) | [![license: GPLv3](https://img.shields.io/badge/license-GPLv3-brightgreen)](/COPYING)

See additional information for how these [tarball
files](https://en.wikipedia.org/wiki/Tar_(computing)) are
[built](./builder/README.md) and [tested](./tests/README.md).

The *libhkl* tarball file depends on specific versions of both
[*gsl*](https://www.gnu.org/software/gsl/) and
[*gobject-introspection*](https://gi.readthedocs.io/en/latest/).

## Project maintainers

The maintainers of this project are listed [here](./MAINTAINERS.md).

## libhkl-v5.0.0.3357-x86_64.tar.gz

package | version
--- | ---
sha256 | `cc439eb4787b577e31a7aa7764df5143cfcded9a9fa22ac7fef7974049f1d727`
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
    python >=3.8,<3.12
```

## libhkl-v5.0.0.3001-x86_64.tar.gz

package | version
--- | ---
sha256 | `b0a79417855ab358a7f1c5e08074b3e7e014b5d2e10c325d6e1328f3442bf69d`
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
    python >=3.8,<3.12
```

## libhkl-v5.0.0.2173-x86_64.tar.gz

package | version
--- | ---
sha256 | `0d36ee67057239f6a439b3f4fecac20df5102627c81bae90f1bc1e3c94e56a90`
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
    python >=3.8,<3.12
```
