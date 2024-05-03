# Build a `libhkl` tarball

The build procedure is executed in a [container](https://www.docker.com/), to
control the suite of installed packages available during the build.

NOTE:  It is not necessary to publish the docker image file created here.  The
docker container is used to build the `libhkl` tarball file to be copied in to
this repository.

The specific versions to be built are configured in the [Dockerfile](./Dockerfile):

```dockerfile
# ENV HKL_TAG="v5.0.0.3001"
ENV HKL_TAG="v5.0.0.3434"
ENV GOBJECT_INTROSPECTION_TAG=1.78.1
ENV GSL_TAG=release-2-7
```

This configuration is for *hkl* (**v5.0.0.3434**)[
https://repo.or.cz/hkl.git/shortlog/refs/tags/v5.0.0.3434].

The build process is run with: `make build`.

The container is run with:  `make run`.  (It may be necessary to run  `make net`
before the container will start.)  Once the container is running, the tarball
file should be available at `/opt/libhkl.tar.gz`.  You can exit the container
once you have copied the tarball file.

The container runs with the name `sandbox`. The tarball can be copied from the
running container with this command on the host workstation:

```bash
docker cp sandbox:/opt/libhkl.tar.gz ./libhkl.tar.gz
```

## Details

The source code for `hkl` is downloaded as a git repository from
`https://repo.or.cz/hkl.git`.  The documentation is not built.

The specific version to be built is provided by use of a repository tag,
specified in the `Dockerfile` as shown above.  This version number is built into
the tarball, as symbol `HKL_VERSION` in the `include/hkl-5/hkl.h` file.  This
becomes available to Python as shown in the [test
program](../tests/try_libhkl.py):

```py
import gi  # gobject-introspection, to access libhkl
gi.require_version("Hkl", "5.0")
from gi.repository import Hkl as libhkl
print(f"{libhkl.VERSION=}")
print(f"Hkl major version: {libhkl._version}")
```

Additional [notes](./notes.md) were recorded while developing this procedure
to build the *libhkl* tarball file(s).

Summary conclusions:

- The hkl source code can be built and installed into a previously-empty
  directory (`/opt/hkl` in this case).  The contents of that directory are
  exactly what is needed to install into a `"${CONDA_PREFIX}"` directory to
  provide this C library for use by [hklpy](https://github.com/bluesky/hklpy).
- The `libhkl.tar.gz` tarball file is created directly from the contents in the
  install directory.
- This repository provides *libhkl* tarballs, pre-built locally.
- The *libhkl* tarball file cannot be built directly in a conda-forge recipe due
  to some conflict over which *gobject-introspection* library is to be used.
- The specific version of both *gsl* and *gobject-introspection* libraries **must
  be identical** in both the build environment (here) and in the Python
  environment as a conda-forge package.
- The versions of pre-built libraries for *gsl*,  *gobject-introspection*, and
  others used to build *hkl* from source are limited with each Linux OS
  distribution and usually do not match versions available as conda-forge
  packages.  Specifically, the current range of Python versions may not be
  supported.
- While it is possible to build a *libhkl* tarball file in a GHA workflow and
  save it as a build artifact, access to that artifact when building the
  conda-forge recipe (in hkl-feedstock) is not so clear.

## Compatible versions of *gobject-introspection*

... at the time of writing ...

The *[gobject-introspection* package on
conda-forge](https://anaconda.org/conda-forge/gobject-introspection/files) is
available for these Python versions (linux, 64-bit):

gobject-introspection version | Python version
--- | ---
1.64.1 | py36 - py38
1.66.1 | py36 - py39
1.72.0 | py37 - py310
1.78.1 | py38 - py312
1.80.1 | py38 - py312

Nothing yet for Python 3.13.

## Example build log

When the `make build` job ends, lines such as these are expected:

```bash
...
#17 [13/17] WORKDIR /opt/hkl
#17 DONE 0.0s

#18 [14/17] RUN tar czf /opt/libhkl.tar.gz */
#18 DONE 0.5s

#19 [15/17] RUN echo "Gnu scientific library (GSL) version: release-2-7"
#19 0.446 Gnu scientific library (GSL) version: release-2-7
#19 DONE 0.5s

#20 [16/17] RUN echo "gobject-introspection version: 1.78.1"
#20 0.510 gobject-introspection version: 1.78.1
#20 DONE 0.5s

#21 [17/17] RUN echo "HKL version: v5.0.0.3357"
#21 0.326 HKL version: v5.0.0.3357
#21 DONE 0.3s

#22 exporting to image
#22 exporting layers
#22 exporting layers 2.4s done
#22 writing image sha256:182d4486903d960b8cfff0dd214947370ffc757ea21ee65eadf83957e5dd35e0 done
#22 naming to docker.io/libhkl/sandbox:latest done
#22 DONE 2.4s
echo "# finished: " `date --iso-8601="seconds"` | tee -a build-log.txt
# finished:  2023-09-28T15:13:15-05:00
```
