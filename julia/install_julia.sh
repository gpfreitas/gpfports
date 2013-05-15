#!/usr/bin/env sh

PREFIX="${HOME}/local"

cd "$PREFIX"/src
git clone git://github.com/JuliaLang/julia.git
cd "$PREFIX"/src/julia
make clean
make


