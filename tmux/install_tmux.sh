#!/usr/bin/env bash

PREFIX="${HOME}/local"

cd "$PREFIX"/src
curl -J -O -L http://sourceforge.net/projects/tmux/files/tmux/tmux-1.8/tmux-1.8.tar.gz
tar zvfx tmux-1.8.tar.gz
cd tmux-1.8
./configure --prefix=$PREFIX CFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
make
make install

