#!/usr/bin/env sh

filename="cling-MacOSX-10.7-64bit-r48537.tar.bz2"

cd ~/src
curl -O https://ecsft.cern.ch/dist/cling/current/"$filename"
tar jvfx "$filename"

