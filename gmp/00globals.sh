# Globals
# -------

# Local machine
PREFIX="${HOME}/local"
localroot="${PREFIX}/src"
portdir=$PWD

# Remote information
name=gmp
version=5.1.1 #  Sat Oct  6 01:12:54 PDT 2012 
program="$name-$version"
srcdir="$program"
patchfile="patches/$program.patch"
tarball="$program".tar.bz2
sigfile="$tarball".sig
mirror="http://ftp.gnu.org/gnu/$name"

# Environment Variables
export MACOSX_DEPLOYMENT_TARGET=10.8
# export CFLAGS="-arch x86_64 -arch i386"
# export CCFLAGS="-arch x86_64 -arch i386 "
# export CXXFLAGS="-arch x86_64 -arch i386"
# export LDFLAGS="-arch x86_64 -arch i386"
