#!/usr/bin/env sh

cd ~/src
curl -O http://invisible-island.net/datafiles/release/mawk.tar.gz
tar zvfx mawk.tar.gz
cd mawk-1.3.4-20130219
./configure --prefix="$HOME"
make
make install

