#!/usr/bin/env bash

cd ~/src
svn checkout http://cvxpy.googlecode.com/svn/trunk/ cvxpy-read-only
cd cvxpy-read-only
python setup.py install --user # check setup.py install options

