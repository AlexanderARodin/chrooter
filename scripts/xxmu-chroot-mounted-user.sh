#!/bin/bash
. .config
. ./scripts/.lib

echo '[+ MOUNT VSF]'
BindSystemVFS

echo "NEWROOT=$NEWROOT"
echo '[ENTER NEW ROOT with VFS as User]'
unshare -Ur -mpu --fork chroot "$NEWROOT" /bin/sh

echo '[- UNMOUNT VSF]'
RemoveSystemVFS
