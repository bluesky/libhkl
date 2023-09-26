# libhkl

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

## libhkl-v5.0.0.3001-x86_64.tar.gz

package | version
--- | ---
sha256 | `0da07cbc3a4421c35d8478696dbd383d4e14d2212ffb919636db245799720f2d`
built on | GitHub Actions workflow
architecture | amd64
OS | ubuntu-20.04
`gobject-introspection` | 1.64.0-2
`libgsl-dev` | 2.5+dfsg-6build1
`libglm-dev` | 0.9.9.7+ds-1

Requirements to build a conda-forge package:

```text
    gobject-introspection =1.64
    gsl =2.5
    pygobject
    python <3.9
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
