#!/usr/bin/env bash

ASRC="$HOME/src/algencan-2.3.7"

mv $ASRC ~/.Trash
cp -R algencan-2.3.7 ~/src
cp algencan-2.3.7_lion_ampl.patch $ASRC
cd $ASRC
patch -p1 < algencan-2.3.7_lion_ampl.patch
make algencan-ampl
cd ~/bin
ln -s $ASRC/bin/ampl/algencan

