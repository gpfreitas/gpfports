#!/usr/bin/env bash

CC=gcc

cd ~/src
mkdir cii20 && cd cii20
curl -O http://cii.googlecode.com/files/cii20.tar.gz
tar zvfx cii20.tar.gz
export BUILDDIR="/Users/guilherme/src/cii20/build/x86_64/"
mkdir -p "$BUILDDIR"
mkdir -p "$BUILDDIR"include
cp -p include/*.h ${BUILDDIR}include
echo "BUILDDIR=$BUILDDIR" > custom.mk
echo "CC=cc -std1 -Dalpha" >> custom.mk
make -k THREADS= EXTRAS=
#make EXTRAS=${BUILDDIR}memcmp.o
## Tests
${BUILDDIR}wf <makefile
${BUILDDIR}cref src/fmt.c src/str.c
#ln -s ${BUILDDIR}include /usr/local/include/cii
#ln -s ${BUILDDIR}libcii.a /usr/local/lib/libcii.a


