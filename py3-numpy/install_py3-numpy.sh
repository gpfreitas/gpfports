#!/usr/bin/env bash

cd ~/src \
    && mkdir -p numpy \
    && cd numpy \
    && git clone git://github.com/numpy/numpy.git || git checkout maintenance/1.7.x \
    && python3 setup.py build \
    && python3 setup.py install \
    && cd \
    && python3 -c "import numpy; numpy.test('full')"

