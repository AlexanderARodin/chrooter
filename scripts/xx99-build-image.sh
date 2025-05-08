#!/bin/bash
set -e

echo '[BUILD IMAGE]'
ROOT_DIR=$(readlink target/current-root)
echo "$ROOT_DIR"
cd target/current-root

set -x
mksquashfs ./ ../$ROOT_DIR.sqsh
cd ..
ln -sv "$ROOT_DIR.sqsh" current-image.sqsh
