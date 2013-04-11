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
        gpg -v --verify "$sigfile" && bzip2 -d $tarball
        if [[ "shasum -a 256 gmp-5.0.5.tar |cut -d ' ' -f 1 == f27c2b2ade704dda9de3530c46cf191ebb6cb4da226ee94de49aba9877ec587e"  ]]; then
            tar -xf $program.tar
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
