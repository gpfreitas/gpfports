#!/usr/bin/env bash

BUILDDIR="build_"`uname -mrs|tr -d ' '`
PREFIX="$HOME/local"
SRCDIR="$PREFIX/src/eigen"

cd "$PREFIX/src"
hg clone https://bitbucket.org/eigen/eigen/ -b 3.1
cd eigen
mkdir "$BUILDDIR" && cd "$BUILDDIR"
cmake -DCMAKE_INSTALL_PREFIX="$PREFIX" "$SRCDIR"
make install

