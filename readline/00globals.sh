# Globals
# -------

# Local machine
PREFIX="${HOME}/local"
localroot="${PREFIX}/src"
portdir=$PWD

# Remote information
name=readline
version=6.2 #  Sat Oct  6 01:12:54 PDT 2012 
program="$name-$version"
srcdir="$program"
patchfile="patches/$program.patch"
tarball="$program".tar.gz
sigfile="$tarball".sig
mirror="http://ftp.gnu.org/gnu/readline"

# Environment Variables
export MACOSX_DEPLOYMENT_TARGET=10.8
export CFLAGS="-arch x86_64 -arch i386"
export CCFLAGS="-arch x86_64 -arch i386 "
export CXXFLAGS="-arch x86_64 -arch i386"
export LDFLAGS="-arch x86_64 -arch i386"
