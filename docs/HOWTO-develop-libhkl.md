# HOWTO (re)build the libhkl code for hklpy

Current steps to compile & test `libhkl` library for `hklpy`.

## Repositories

- hklpy (Python)
  - [source](https://github.com/bluesky/hklpy)
  - conda-forge [feedstock](https://github.com/conda-forge/hklpy-feedstock)
- hkl (C)
  - [source](https://repo.or.cz/hkl.git)
  - conda-forge [feedstock](https://github.com/conda-forge/hkl-feedstock)
- libhkl (compiled library)
  - [source](https://github.com/bluesky/libhkl)
  - Published on conda-forge using the hkl feedstock

## Toolchain

The toolchain requires docker to be available on the development
workstation.  Various parts must be edited if an alternative to docker
(such as podman) is used.

Build the tool chain, compile `hkl` from the source code, and build
`libhkl.tar.gz`.  The `Dockerfile` defines and executes the scripted
steps.

1. `git clone https://github.com/bluesky/libhkl`
2. `cd libhkl/builder`
3. `make build run` and leave this container running for the next step
4. In a different terminal window, `docker cp sandbox:/opt/libhkl.tar.gz ../tests`
5. `exit` from the container started in step 3.

Test the new library with Python:

1. `cd ../tests`
2. `docker build -t libhkl/test:latest ./`
3. `docker run -i -t libhkl/test:latest /bin/bash`
4. In the container just started, run the installation tests:
   `bash /home/run-libhkl.sh`
5. Run any other unscripted tests in the container.
6. `exit` from the container started in step 3.

## Development

Instructions how to modify the `hkl` C code or to add a new geometry are
beyond the scope of this document.

Here are brief instructions to develop from a branch or fork of the
`hkl` source code repository (such as the BCDA development source):

- Build the tool chain as above.
- Create a branch or fork of the `hkl` source for this development.
- Create a new branch in `libhkl` to build and test this development.
- Modify the `builder/Dockerfile` for these changes:
  - `HKL_REPO_URL` = the URL to your clone of the `hkl` source code
  - `HKL_TAG` : the name of your branch of the `hkl` source code
  - continue from the `make build run` step, as above
