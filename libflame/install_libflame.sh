#!/usr/bin/env bash


name=libflame
version=r9287 # Tue Sep 18 17:25:06 PDT 2012 
program="$name-$version"
patchfile="patches/$program.patch"
tarball="$program".tar.gz
mirror="http://www.cs.utexas.edu/users/flame/snapshots"


# FETCH & UNPACK
pushd ~/src
if [[ ! -f "$tarball" ]]; then
    ~/bin/curl -O "$mirror/$tarball"
    
elif [[ ! -d "$program" ]]; then
    tar zvfx "$tarball"
fi

# PATCH
popd 
if [[ -f "$patchfile" ]]; then
    cp "$patchfile" ~/src/patches
fi
pushd ~/src
patch -p0 < "$patchfile"

# BUILD DOCS
cd $program/docs/libflame
make

# CONFIGURE

cd ../..
./configure

# COMPILE
make

# TEST
make check

# INSTALL
make install

