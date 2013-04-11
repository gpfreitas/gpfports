#!/usr/bin/env sh

cd ~/src
mkdir rng_lfsr_lecuyer
cd rng_lfsr_lecuyer

for f in lfsr113.c lfsr113.h lfsr258.c lfsr258.h; do
    curl -O 'http://www.iro.umontreal.ca/~simardr/rng/'"$f" 
done


