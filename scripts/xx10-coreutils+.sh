#!/bin/bash
set -e
#. scripts/.lib

# dirs etc
sudo mkdir -v $NEWROOT/bin
sudo mkdir -v $NEWROOT/proc
sudo mkdir -v $NEWROOT/dev
sudo mknod    $NEWROOT/dev/console c 5 1

# # # # # # # # # # # # # #
# BUSYBOX
sudo cp -v $BUSYBOX/busybox $NEWROOT/bin/

# # # # # # # # # # # # # #
# UUTILS/COREUTILS
sudo cp -v $UUTILS/coreutils $NEWROOT/bin/


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
