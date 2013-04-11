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
        if [[ "gpg -v --verify $sigfile" ]] && [[ "shasum $tarball |cut -d ' ' -f 1 == 8c7e19ad0dd9b3b5cc652273403423d6cf0c5edf" ]]; then
            tar zvfx $tarball
        fi
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

