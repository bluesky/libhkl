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

```bash
# bash /home/run-libhkl.sh
libhkl.VERSION='v5.0.0.3357'
1	E4CH
2	E4CV
3	E6C
4	K4CV
5	K6C
6	PETRA3 P09 EH2
7	PETRA3 P23 4C
8	PETRA3 P23 6C
9	SOLEIL MARS
10	SOLEIL NANOSCOPIUM ROBOT
11	SOLEIL SIRIUS KAPPA
12	SOLEIL SIRIUS TURRET
13	SOLEIL SIXS MED1+2
14	SOLEIL SIXS MED2+2
15	SOLEIL SIXS MED2+3
16	SOLEIL SIXS MED2+3 v2
17	TwoC
18	ZAXIS
```

## Details

The libhkl tarball to be tested is copied manually into the `tests` directory.
