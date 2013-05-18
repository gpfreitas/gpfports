#!/usr/bin/env sh

cd "$PREFIX"/src
git clone https://github.com/erikfrey/bashreduce.git

cd "$PREFIX"/src/bashreduce
sed -i .bak "s:/usr/local/bin:$PREFIX/bin:g" brutils/Makefile

cd "$PREFIX"/src/bashreduce/brutils
make
make install

