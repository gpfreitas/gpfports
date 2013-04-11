#!/usr/bin/env bash

version="3-1-5"
architecture="ix86Mac-darwin"
prefix="/Users/guilherme"
localroot="$prefix"/src
srcdir="Singular"

cd ~/src
#curl -O ftp://www.mathematik.uni-kl.de/pub/Math/Singular/UNIX/Singular-"$version"-share.tar.gz
#curl -O ftp://www.mathematik.uni-kl.de/pub/Math/Singular/UNIX/Singular-"$version"-"$architecture".tar.gz
#tar zvfx Singular-"$version"-share.tar.gz
#tar zvfx Singular-"$version"-"$architecture".tar.gz
cd $localroot/$srcdir
ln -s $localroot/$srcdir/$version/$architecture/Singular $prefix/bin/Singular-$version
ln -s $localroot/$srcdir/$version/$architecture/ESingular $prefix/bin/ESingular-$version
ln -s $prefix/bin/Singular-$version $prefix/bin/Singular
ln -s $prefix/bin/ESingular-$version $prefix/bin/ESingular
