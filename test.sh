#!/bin/bash

git clone http://github.com/$TRAVIS_REPO_SLUG.git &&
cd compiler-workout &&
git checkout $TRAVIS_COMMIT &&
eval `opam config env` &&
make &&
make regression
