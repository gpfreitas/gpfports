#!/usr/bin/env bash

cd ~/src \
    && mkdir -p scipy \
    && cd scipy \
    && git clone git://github.com/scipy/scipy.git || git pull \
    && python3 setup.py build \
    && python3 setup.py install \
    && cd \
    && python3 -c 'import scipy; scipy.test()'

