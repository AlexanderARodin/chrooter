#!/bin/bash
set -e
#. target/env

echo "[ENTER ROOT DIR]"
cd target/current-root
mkdir -vp bin
pwd
ls -lah ../
cp -v ../$BUSYBOX/busybox       bin
cp -v ../$BUSYBOX/busybox.suid  bin || true
cp -v ../$UUTILS/coreutils      bin

# # # # # # # # # # # # # #
# INSTALL shortcuts
cd bin

LIST_BB=$(./busybox --list)
for l in $LIST_BB
do
	ln -vsr ./busybox $l
done

LIST_UU=$(./coreutils --list)
for l in $LIST_UU
do
	ln -vsr ./coreutils $l
done
