#!/bin/bash
set -e

. .config

# BIN dir
sudo mkdir -v $NEWROOT/bin

# # # # # # # # # # # # # #
# BUSYBOX
sudo cp -v $BUSYBOX $NEWROOT/bin/busybox

# # # # # # # # # # # # # #
# UUTILS/COREUTILS
sudo cp -v $UUTILS $NEWROOT/bin/coreutils


# # # # # # # # # # # # # #
# INSTALL shortcuts
cd $NEWROOT/bin/
echo 'INSTALLing ->' $(pwd)

LIST_BB=$(./busybox --list)
for l in $LIST_BB
do
	sudo ln -sr ./busybox $l
done

LIST_UU=$(./coreutils --list)
for l in $LIST_UU
do
	sudo ln -sr ./coreutils $l
done
