#!/bin/bash

mkdir -p "${PRIVATE_WORKSPACE_PATH}"
cd "${PRIVATE_WORKSPACE_PATH}"

git clone git@bitbucket.org:beatngu13/master-thesis.git
git clone git@bitbucket.org:beatngu13/papers.git

git clone git@github.com:beatngu13/pdf-zoom-wizard.git
git clone git@github.com:beatngu13/knapsack-problem.git

git clone git@github.com:junit-pioneer/junit-pioneer.git
