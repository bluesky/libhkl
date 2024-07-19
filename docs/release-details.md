# libhkl

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

DONE: [TODO]: Must rebuild these with newer package versions outside of github actions.
See code in <https://github.com/bluesky/libhkl/tree/main/builder>.

gobject-introspection version | Python version
--- | ---
1.64.1 | py36 - py38
1.66.1 | py36 - py39
1.72.0 | py37 - py310
1.78.1 | py38 - py311

build gobject-introspection and gsl from source

## libhkl-v5.0.0.3001-x86_64.tar.gz

package | version
--- | ---
sha256 | `b0a79417855ab358a7f1c5e08074b3e7e014b5d2e10c325d6e1328f3442bf69d`
built on | [Docker](https://github.com/bluesky/libhkl/tree/main/builder)
architecture | x86_64
OS | debian:bullseye
`gobject-introspection` | 1.78.1 (built from source)
`libgsl-dev` | 2.7 (built from source)

Requirements to build a conda-forge package:

```text
    gobject-introspection =1.78.1
    gsl =2.7
    pygobject
    python >=3.8,<3.12
```

NOTE: `gobject-introspection =1.64` is available on conda-forge for py36-py38.
To get later versions and use contemporary Python versions, need to build these
somewhere else than GitHub Actions workflows.

## libhkl-v5.0.0.3357-x86_64.tar.gz

NOTE: Cannot build conda-forge package since gsl=2.7.1 not available.

package | version
--- | ---
sha256 | `cc439eb4787b577e31a7aa7764df5143cfcded9a9fa22ac7fef7974049f1d727`
built on | [Docker](https://github.com/bluesky/libhkl/tree/main/builder)
architecture | x86_64
OS | debian:bullseye
`gobject-introspection` | 1.78.1 (built from source)
`libgsl-dev` | 2.7 (built from source)

Requirements to build a conda-forge package:

```text
    gobject-introspection =1.78.1
    gsl =2.7
    pygobject
    python >=3.8,<3.12
```
