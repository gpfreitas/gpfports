#!/usr/bin/env bash

cd ~/src
curl -O http://www.seas.upenn.edu/~bcpierce/unison//download/releases/stable/unison-2.40.63.tar.gz
tar zvfx unison-2.40.63.tar.gz
cd unison-2.40.63
make UISTYLE=text
cp ./unison ~/bin

