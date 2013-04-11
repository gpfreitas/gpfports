#!/usr/bin/env sh

cd ~/context
rsync -ptv rsync://contextgarden.net/minimals/setup/first-setup.sh .
./first-setup.sh --modules=all

