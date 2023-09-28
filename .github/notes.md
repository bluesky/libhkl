# About the CI workflows

Cannot build the tarballs here due to limitations of the OS versions (and
associated packages) available in GitHub Actions workflows.  Instead, build each
tarball locally, and commit to this repo with suitable name.  Adjust the CI for
the tarballs to be tested.

For CI, test each of the tarballs in a conda environment.
