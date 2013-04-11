#!/usr/bin/env bash

cd ~/src
curl http://nmap.org/dist/nmap-6.01.tar.bz2 | tar jx
cd nmap-6.01
./configure --prefix=$HOME
make
make install

