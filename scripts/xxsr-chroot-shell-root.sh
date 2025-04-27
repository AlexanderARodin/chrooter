#!/bin/bash
set -e
. .config

echo "NEWROOT=$NEWROOT"
echo '[ENTER NEW ROOT as Root]'
sudo unshare -mpu --fork chroot "$NEWROOT" /bin/sh
