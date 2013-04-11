#!/usr/bin/env sh

cd ~/src
mkdir rng_streams_lecuyer
cd rng_streams_lecuyer

for f in Readme.txt RngStream.bbl RngStream.c RngStream.h RngStream.pdf RngStream.tex example1.c test2RngStream.c test2RngStream.res testRngStream.c
do
    curl -O 'http://www.iro.umontreal.ca/~lecuyer/myftp/streams00/c2010/'"$f"
done



