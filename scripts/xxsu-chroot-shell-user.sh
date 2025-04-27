#!/bin/bash
set -e
. .config
echo '[ENTER NEW ROOT as User]'
unshare -Ur -mpu --fork chroot "$NEWROOT" /bin/sh
