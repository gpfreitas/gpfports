#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Apply upstream patches
function apply_upstream_patches ()
{
    cd "$localroot"/"$srcdir"
    patch -p0 < $portdir/patches/upstream/readline62-001
    patch -p0 < $portdir/patches/upstream/readline62-002
    patch -p0 < $portdir/patches/upstream/readline62-003
    patch -p0 < $portdir/patches/upstream/readline62-004
}

# Apply local patches
function apply_local_patches ()
{
    cd "$localroot"/"$srcdir"
    patch -p1 < $portdir/patches/local/readline62-local01.patch
}


# Main Program
# ------------

apply_upstream_patches \
    && apply_local_patches


