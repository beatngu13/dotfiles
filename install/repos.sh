#!/bin/bash

# Private.

mkdir -p ${PRIVATE_WORKSPACE_PATH}
cd ${PRIVATE_WORKSPACE_PATH}

git clone git@bitbucket.org:beatngu13/master-thesis.git
git clone git@bitbucket.org:beatngu13/papers.git

git clone git@github.com:beatngu13/pdf-zoom-wizard.git

# ReTest.

mkdir -p ${RETEST_WORKSPACE_PATH}
cd ${RETEST_WORKSPACE_PATH}

git clone git@bitbucket.org:retest/bugsubmitter.git
git clone git@bitbucket.org:retest/retest.git
git clone git@bitbucket.org:retest/surili.git
git clone git@bitbucket.org:retest/bugsubmitter.git
git clone git@bitbucket.org:retest/reports-2021-kmuinnovativ-surili.git

git clone git@github.com:retest/gui-state-machine-api.git
git clone git@github.com:retest/rebazer.git
git clone git@github.com:retest/recheck.git
git clone git@github.com:retest/recheck-cli.git
git clone git@github.com:retest/recheck-web.git
