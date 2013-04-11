#!/usr/bin/env sh

#cd ~/src/
#git clone https://github.com/joyent/node.git
#
#cd ~/src/node 
#git checkout

cd ~/src/node
./configure --prefix="$HOME"
make
make test
make doc
make install

