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
        gpg -v --verify "$sigfile"
        echo "Not checking integrity of the sources."
        tar zvfx "$tarball"
    fi
}

# Get upstream patches and verify their authenticity and integrity if possible
function get_upstream_patches ()
{
    cd $portdir/patches/upstream
    for patch_file in readline62-001 readline62-002 readline62-003 readline62-004
    do
        if [[ ! -f "$patch_file" ]] || [[ ! -f "$patch_file".sig ]]; then
            curl -O "$mirror"/"$program"-patches/"$patch_file"
            curl -O "$mirror"/"$program"-patches/"$patch_file".sig
            gpg -v --verify "$patch_file".sig
        fi
    done
}


# Main Program
# ------------

get_source \
  && get_upstream_patches
