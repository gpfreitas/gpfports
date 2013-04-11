#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Apply upstream patches
function apply_upstream_patches ()
{
    cd $localroot/$srcdir
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


