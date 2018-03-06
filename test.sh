#!/bin/bash

cd /usr/share/compiler-workout &&
eval `opam config env` &&
make &&
make regression
