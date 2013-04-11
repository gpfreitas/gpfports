#!/usr/bin/env sh

cd ~/src
git clone https://github.com/erikfrey/bashreduce.git

cd ~/src/bashreduce
sed -i .bak 's:/usr/local/bin:~/bin:g' brutils/Makefile

cd ~/src/bashreduce/brutils
make
make install

