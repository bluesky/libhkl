# libhkl

Build the *hkl*  C library (described here as
[*libhkl*](https://people.debian.org/~picca/hkl/hkl.html#)) for
[hklpy](https://github.com/bluesky/hklpy). Publish on
[conda-forge](https://anaconda.org/conda-forge/hkl) using the
[hkl-feedstock](https://github.com/conda-forge/hkl-feedstock).

## libhkl-v5.0.0.3001-x86_64.tar.gz

package | version
--- | ---
built on | GitHub Actions workflow
architecture | amd64
OS | ubuntu-20.04
`gobject-introspection` | 1.64.0-2
`libgsl-dev` | 2.5+dfsg-6build1
`libglm-dev` | 0.9.9.7+ds-1

Requirements to build a conda-forge package:

```text
    gobject-introspection=1.64.0
    gsl=2.5
    pygobject
```

## libhkl-v5.0.0.3357-x86_64.tar.gz

NOTE: Cannot build conda-forge package since gsl=2.7.1 not available.

package | version
--- | ---
built on | GitHub Actions workflow
architecture | amd64
OS | ubuntu-22.04
`gobject-introspection` | 1.72.0-1
`libgsl-dev` | 2.7.1+dfsg-3
`libgclm-dev` | 0.8.4-3

Requirements to build a conda-forge package:

```text
    gobject-introspection=1.72.0
    gsl=2.7.1  <-- not available!
    pygobject
```
