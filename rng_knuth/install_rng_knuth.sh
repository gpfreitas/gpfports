#!/usr/bin/env sh

cd ~/src
mkdir rng_knuth
cd rng_knuth

curl -O 'http://www-cs-faculty.stanford.edu/~knuth/programs/rng.c'
curl -O 'http://www-cs-faculty.stanford.edu/~knuth/programs/rng-double.c'
curl -O 'http://www-cs-faculty.stanford.edu/~knuth/programs/frng.f'
curl -O 'http://www-cs-faculty.stanford.edu/~knuth/programs/frngdb.f'

