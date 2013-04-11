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
#
# I ended up implementing something a bit different. Make local tags, all
# right, just like in the FAQ, but I made global tags not necessarily at the
# root, but at some parent of the root. For example, that way we can tag only
# what we want from /usr/local or /Library/Frameworks without tagging
# everything.

# Global Variables
LOCALROOTS="$HOME/src /Library/Frameworks/EPD64.framework /System/Library/Frameworks/vecLib.framework"
GLOBALROOTS="$HOME/src /usr/include /Library/Frameworks /System/Library/Frameworks"
CTAGS=$HOME/bin/ctags

# Subroutines
make_local_tags()
{
    while IFS= read -r -d $'\0' dir; do # '\0'=null char, from -print0 below
        cd "$dir"
        $CTAGS *
    done < <(find $1 -type d -print0)
}

make_global_tags()
{
    echo "Building global tags at $1"
    cd $1
    $CTAGS --file-scope=no -R
    echo "Make global tags."
}

# Main
for root in $LOCALROOTS
do
    echo ">>> Making local tags at $root."
    make_local_tags "$root"
    make_global_tags "$root"
done

for root in $GLOBALROOTS
do
    echo ">>> Making global non-static tags at $root."
    make_global_tags "$root"
done

# Comments
#
# The following does not work well, because cd fails at some directories with
# spaces.
#
#make_local_tags()
#{
#    echo "Building local tags at $1"
#    cd $1
#    for i in $(find $1 -type d)
#    do
#        cd "$i"
#        $CTAGS *
#    done
#}
