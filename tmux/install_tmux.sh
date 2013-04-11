#!/usr/bin/env bash

cd ~/src
curl -L http://sourceforge.net/projects/tmux/files/tmux/tmux-1.6/tmux-1.6.tar.gz | tar zx
cd tmux-1.6
./configure --prefix=$HOME CFLAGS="-I$HOME/include" LDFLAGS="-L$HOME/lib"
make
make install

