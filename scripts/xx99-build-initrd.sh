#!/bin/bash
set -e

echo '[BUILD INITRD]'
cd target/current-root
find . | cpio -o -H newc -V | gzip -9 > ../initrd.gz
