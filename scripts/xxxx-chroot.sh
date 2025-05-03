#!/bin/bash
set -e
. .config

echo "NEWROOT=$NEWROOT; CMD=$1"
echo '[CHANGE ROOT]'
sudo chroot "$NEWROOT" $1
