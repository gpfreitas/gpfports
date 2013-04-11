#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Apply upstream patches
function apply_upstream_patches ()
{
    cd $localroot/$srcdir
    curl http://www.mpfr.org/mpfr-3.1.1/allpatches | patch -N -Z -p1
}

# Apply local patches
function apply_local_patches ()
{
    cd $localroot/$srcdir
}


# Main Program
# ------------

apply_upstream_patches \
    && apply_local_patches


