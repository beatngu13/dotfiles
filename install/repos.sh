#!/usr/bin/env sh

mkdir -p "${PRIVATE_WORKSPACE_PATH}"
cd "${PRIVATE_WORKSPACE_PATH}"

git clone git@github.com:beatngu13/junit-pioneer.git
cd junit-pioneer/
git remote add junit-pioneer git@github.com:junit-pioneer/junit-pioneer.git
cd -

git clone git@github.com:beatngu13/knapsack-problem.git
git clone git@github.com:beatngu13/pdf-zoom-wizard.git
