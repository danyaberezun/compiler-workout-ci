#!/bin/bash

cd /usr/share/compiler-workout &&
export OPAMSWITCH=lama &&
eval $(opam env) &&
make &&
make regression
