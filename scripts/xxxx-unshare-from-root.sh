#!/bin/bash
. .config

echo "NEWROOT=$NEWROOT; CMD=$1"
echo '[ENTER NEW ROOT with VFS as Root]'
sudo unshare --fork \
	--mount --uts --ipc --net \
	--pid --mount-proc \
	--root="$NEWROOT" \
	$1

