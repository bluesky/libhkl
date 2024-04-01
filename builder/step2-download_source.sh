#!/bin/bash

echo "Clone repo from: ${HKL_REPO_URL}"
git clone "${HKL_REPO_URL}"

# Additional libraries need to compile libhkl.
apt-get install -y libcglm-dev ghc # libinih-dev
