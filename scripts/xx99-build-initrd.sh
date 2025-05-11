#!/bin/bash
set -e

echo '[BUILD INITRD]'
ROOT_DIR=$(readlink target/current-root)
echo $ROOT_DIR

cd target/current-root
find . | cpio -o -H newc -V | gzip -9 > ../$ROOT_DIR.gz
cd ..
ln -sfv "$ROOT_DIR.gz" current-initrd.gz
