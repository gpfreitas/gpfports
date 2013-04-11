# 1. Hand-Coded Definitions
# =========================

# Libray Info
LIBPREFIX="unison"

# Remote names
REMOTE_SOURCE="https://webdav.seas.upenn.edu/svn/unison"

# Local commands and paths
FETCH="svn checkout"
UNPACK=""
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
else
	echo "---> Source already downloaded."
fi


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

PACKAGENAME=$LIBPREFIX
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

#make check > log 2>&1 


# 10. Install
# ===========

make
make install

