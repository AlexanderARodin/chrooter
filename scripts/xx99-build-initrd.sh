#!/bin/bash
set -e
. scripts/.lib

echo '[BUILD INITRD]'
cd $NEWROOT
#sudo find . | sudo cpio -o -H newc -V | gzip -2 > ../initrd.gz
find . | cpio -o -H newc -V | gzip -9 > ../initrd.gz
