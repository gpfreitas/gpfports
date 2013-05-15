# 1. Hand-Coded Definitions
# =========================

# Libray Info
LIBPREFIX="pv"

# Remote names
REMOTE_SOURCE="http://pipeviewer.googlecode.com/files/pv-1.2.0.tar.bz2"
REMOTE_SIGNATURE="http://www.ivarch.com/programs/sources/pv-1.2.0.tar.bz2.txt"

# Local commands and paths
FETCH="curl -O"
UNPACK="tar jfx"
AUTHENTICATE=""
CHECK_INTEGRITY=""
INSTALL_DIR="$HOME" 

COMPILER="gcc"
 
# configure flags
CONFFLAGS="--prefix=$INSTALL_DIR"
 

# 2. Automatic Definitions (Don't touch these)
# ============================================


# 3. Fetch the source code
# ========================

echo "
=======================
Beginning Installation.
=======================
"

# If $INSTALL_DIR/src does not exist, create it and go there
if [ ! -d "$INSTALL_DIR/src" ]; then
	mkdir "$INSTALL_DIR/src"
fi
cd "$INSTALL_DIR/src"

# Download source code if necessary
if [ ! -f $LIBPREFIX*.tar.bz2 ]
then
	echo "---> Source not downloaded. Downloading it now..."
	$FETCH $REMOTE_SOURCE
	$FETCH $REMOTE_SIGNATURE
	#$FETCH $REMOTE_CHECKSUM
else
	echo "---> Source already downloaded."
fi

# Find the name of the source file to redefine $PACKAGE. This allows us to use
# a manually downloaded package.
PACKAGE=`find . -name "$LIBPREFIX*.tar.bz2" -depth 1`
PACKAGE=${PACKAGE:2:100}
PACKAGENAME=${PACKAGE%.tar.bz2} #something like `gsl-1.15`

echo "
---> Unpacking $PACKAGE...
"
$UNPACK $PACKAGE


# 4. Check authenticity of the files (TODO)
# =========================================

echo "
---> Not checking authenticity of downloaded files...
"


# 5. Check integrity of the files (TODO)
# ======================================

echo "
---> Not checking integrity of downloaded files...
"

# 6. Patching
# ===========

cd $PACKAGENAME


# 7. Configure
# ============

echo "
---> Configuring $PACKAGENAME...
"


# sh autogen.sh # OBSOLETE. Trying to use Mac OS X's libtool to enable shared
# libraries. When used, gave me the following message:
# If you use a recent version of autotools, this script is obsolete
# Just run autoreconf -i -f -v
# followed by ./configure --enable-maintainer-mode. So that's what we will do.
# autoreconf -i -f -v

env CC="$COMPILER" ./configure $CONFFLAGS


# 9. Check Compilation
# ====================

if [ $MAKECHECK = 1 ]
then 
	echo "\n---> Checking compilation... Check log file at $INSTALL_DIR/src.\n"
	make check > log 2>&1 
	#make check
else
	echo "\n---> Not checking compilation.\n"
fi

# 10. Install
# ===========

make
make install

