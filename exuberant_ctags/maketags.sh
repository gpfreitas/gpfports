#!/usr/bin/env bash

# For exuberant ctags. According the their FAQ, implements the following:
#
#   A local tag file in each directory containing only the tags for source
#   files in that directory, in addition to one single global tag file present
#   in the root directory of your hierarchy, containing all non-static tags
#   present in all source files in the hierarchy.
#
# Below list the roots of different source hierarchies/trees in the ROOTS
# variable (separated by spaces).

# Global Variables
ROOTS="""
    $HOME/src
    /Library/Frameworks/EPD64.framework
    /System/Library/Frameworks/vecLib.framework
    /usr/include
"""
CTAGS=$HOME/bin/ctags
CTAGSDIR=$HOME/myctags
CTAGSCONF=$HOME/.ctags

# Subroutines
make_tags()
{
    root=$1
    tagfile=$2
    $CTAGS -R -f "$CTAGSDIR"/"$tagfile" "$root"
}

# Main
if [[ !(-d $CTAGSDIR) ]]; then
    mkdir $CTAGSDIR
fi
for root in $ROOTS
do
    tagfile=$(basename "$root"); tagfile=${tagfile/./_}
    echo ">>> Building ctags from $root."
    echo ">>> Tagfile: $CTAGSDIR/$tagfile."
    make_tags "$root" "$tagfile"
    echo "$root $tagfile" >> README
    echo ">>> Finished building tags."
done
echo '--python-kinds=-i' > $CTAGSCONF #Excludes imports


