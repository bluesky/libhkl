# Test a `libhkl` tarball

The test procedure is executed in [conda](https://docs.conda.io/)
[environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
within a [mambaforge](https://hub.docker.com/r/condaforge/mambaforge)-based
[container](https://www.docker.com/), to control the various packages available
on the test computer.  This setup ensures the package is tested in the way it
will be used as a [conda-forge](https://conda-forge.org/) package.

Testing requires a `libhkl.tar.gz` file in this directory (to test with Python).
See the [build process](../builder/README.md) to get such a tarball.

Build the test image with: `docker build -t libhkl/test:latest ./`

Run the test image by starting the container:

    docker run -i -t libhkl/test:latest /bin/bash

In the `test/libhkl` container, run the tests with `bash /home/run-libhkl.sh`

TODO: show the output

## Details

The libhkl tarball to be tested is copied manually into the `tests` directory.
