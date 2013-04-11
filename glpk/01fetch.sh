#!/usr/bin/env bash

source 00globals.sh

# Subroutines
# -----------

# Get the source and verify its authenticity and integrity if possible
function get_source ()
{
    cd $localroot
    if [[ ! -d "$srcdir" ]]; then
        if [[ ! -f "$tarball" ]]; then
            curl -O "$mirror/$tarball"
        fi
        if [[ ! -f "$sigfile" ]]; then
            curl -O "$mirror/$sigfile"
        fi
        gpg -v --verify "$sigfile" && tar zvfx $tarball
    fi
}

# Get upstream patches and verify their authenticity and integrity if possible
function get_upstream_patches ()
{
    echo "----> No upstream patches to fetch."
}


# Main Program
# ------------

get_source \
  && get_upstream_patches
