=============================================
gpfports: UNIX software installation scripts.
=============================================
:Author: Guilherme Freitas <guilherme@gpfreitas.net>

__NOTE (Jan 2016)__: _the installation scripts point to old software versions
(the scripts are from 2013), and right now they are Mac-only. That said, I
tried to keep all scripts POSIX-compliant, and thus they should be easy to
adapt in case you need a very lightweight tool to maintain your own small set
of custom programs installed from source. If you want a minimal understanding
of the use-case, take a look at the glpk (and its dependencies) installation
scripts._

As of April 10th, 2013, these were written only for my Macbook Air running Mac
OS X 10.8 (Mountain Lion).  To run it anywhere else, you *will* have to edit
the scripts. Use with caution.


./dependency_graph.txt
    Encodes the dependency relationships between the programs. If program `a`
    depends on programs `x`, `y`, `z`, then this file should have the following
    lines::

        a x
        a y
        a z

./install_order.sh
    Uses the UNIX utility `tsort` to output a safe-to-install order of the
    programs in `dependency_graph.txt`. Technically, the `dependency_graph.txt`
    file encodes a directed acyclic graph (DAG) and `tsort` does a topological
    sort on that graph.

./mac_native.txt
    Lists programs already installed by default (or that you should obtain from
    Apple).

This repository should have three branches: `freebsd`, `linux` and `macosx`,
each containing scripts that work on the corresponding OS. The scripts should
work on all supported architectures, if the OS allows it.

We have in mind two types of programs that will be installed:

1. UNIX-like programs, that should go either in `/usr/local` or `~/local`. We
   will call those *unix programs*.
2. Other, more self-contained programs (including binary stuff) that should go
   in `/opt` or `~/opt`. We will call those *blobs*.

Each one of the folders above is a possible *prefix*. The default prefix should
be in the user's home directory. The tree strucutre of the prefixes for unix
programs is well understood: `lib`, `include`, `bin`, etc.  The source files
should go in `src` (these are all relative to the prefix, like `~/local/src`).

