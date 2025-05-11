#!/bin/bash
set -e

echo '[BUILD IMAGE]'
ROOT_DIR=$(readlink target/current-root)
echo "$ROOT_DIR"
cd target/current-root

mksquashfs ./ ../$ROOT_DIR.sqsh
cd ..
ln -sfv "$ROOT_DIR.sqsh" current-image.sqsh
