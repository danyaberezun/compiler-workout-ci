#!/bin/bash

git clone https://github.com/teners/compiler-workout.git &&
cd compiler-workout &&
git checkout $TRAVIS_COMMIT &&
eval `opam config env` &&
make &&
make regression
