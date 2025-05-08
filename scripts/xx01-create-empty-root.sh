#!/bin/bash
set -e

echo '[NEW ROOT]'
NEW_ROOT_DIR=$(basename $(mktemp -d -p target root-XXXX))
echo "$NEW_ROOT_DIR"

rm -vf target/current-root
ln -sv "$NEW_ROOT_DIR" target/current-root
mkdir -pv target/"$NEW_ROOT_DIR/proc"
