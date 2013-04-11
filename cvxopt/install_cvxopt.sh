#!/usr/bin/env bash

cd ~/src
curl http://abel.ee.ucla.edu/src/cvxopt-1.1.5.tar.gz | tar zx
patch -p0 < ~/archive/config_scripts/mLionMBA/cvxopt/patches/cvxopt-1.1.5_veclib_gsl_glpk_fftw.patch
cd cvxopt-1.1.5
cd src
# Use the python you will use with CVXOPT in the command below
python3.3 setup.py install --home="$HOME"
echo "Include $INSTALL_DIR/lib/python in your PYTHONPATH environment variable."


