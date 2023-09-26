# libhkl

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

TODO: Must rebuild these with newer package versions outside of github actions.
See code in https://github.com/prjemian/docker-ideaspace/tree/main/hkl-3357.

gobject-introspection version | maximum Python version
--- | ---
1.64 | py38
1.66.1 | py39
1.72.0 | py310

## libhkl-v5.0.0.3001-x86_64.tar.gz

package | version
--- | ---
sha256 | `5c1766a319ef59309bd2f25994fdc1f007c6c62a3441da71373609e493a79110`
built on | [Docker](https://github.com/prjemian/docker-ideaspace/tree/main/hkl-3357)
architecture | amd64
OS | debian:bullseye
`gobject-introspection` | 1.66.1-1+b1
`libgsl-dev` | 2.6+dfsg-2
`libcglm-dev` | 0.7.9-1

Requirements to build a conda-forge package:

```text
    gobject-introspection =1.66.1
    gsl =2.6
    pygobject
    python <3.10
```

NOTE: `gobject-introspection =1.64` is available on conda-forge for py36-py38.
To get later versions and use contemporary Python versions, need to build these
somewhere else than GitHub Actions workflows.

## libhkl-v5.0.0.3357-x86_64.tar.gz

NOTE: Cannot build conda-forge package since gsl=2.7.1 not available.

package | version
--- | ---
sha256 | `07dd725ebb668f0dd4bd23f78dc422eb1f4aa1f7cb2274e2cc76d42ce2baf768`
built on | GitHub Actions workflow
architecture | amd64
OS | ubuntu-22.04
`gobject-introspection` | 1.72.0-1
`libgsl-dev` | 2.7.1+dfsg-3
`libgclm-dev` | 0.8.4-3

Requirements to build a conda-forge package:

```text
    gobject-introspection =1.72.0
    gsl =2.7.1  <-- not available!
    pygobject
```
