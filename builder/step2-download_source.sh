#!/bin/bash

export HKL_REPO_URL="https://repo.or.cz/hkl.git"

git clone "${HKL_REPO_URL}"

pushd hkl
git checkout --detach "${HKL_TAG}"
popd
