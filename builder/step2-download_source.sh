#!/bin/bash

echo "Clone repo from: ${HKL_REPO_URL}"
git clone "${HKL_REPO_URL}"

pushd hkl
echo "Checkout branch: ${HKL_TAG}"
git checkout --detach "${HKL_TAG}"
popd
