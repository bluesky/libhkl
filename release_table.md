# Overview of Releases

See [release details](https://github.com/bluesky/libhkl/releases) for more information.

release | tarball
--- | ---
[v1.2.1](https://github.com/bluesky/libhkl/releases/tag/v1.2.1) | `libhkl-v5.0.0.3434-x86_64.tar.gz`
[v1.2.0](https://github.com/bluesky/libhkl/releases/tag/v1.2.0) | `libhkl-v5.0.0.3357-x86_64.tar.gz`
[v1.1.0](https://github.com/bluesky/libhkl/releases/tag/v1.1.0) | `libhkl-v5.0.0.3001-x86_64.tar.gz`
[v1.0.0](https://github.com/bluesky/libhkl/releases/tag/v1.0.0) | `libhkl-v5.0.0.2173-x86_64.tar.gz`

## libhkl-v5.0.0.3434-x86_64.tar.gz

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

