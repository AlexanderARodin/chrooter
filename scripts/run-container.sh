#!/bin/bash
set -e

NEWROOT="$2"
CMD="$3"

case $1 in
	--help)
		echo 'Usage: run-container.sh [opt] [root-dir [cmd]]'
		echo '    --help         : this help'
		echo '    --chroot       : sudo chroot         root-dir [cmd]'
		echo '    --unshare-root : sudo unshare ..     root-dir [cmd]'
		echo '    --unshare-user :      unshare -Ur .. root-dir [cmd]'
		;;

	--chroot)
		sudo chroot "$NEWROOT" $CMD
		;;

	--unshare-root)
		sudo unshare --fork \
			--mount --uts --ipc --net \
			--pid --mount-proc \
			--root="$NEWROOT" \
			$CMD
		;;

	--unshare-user)
		unshare --fork \
			-Ur \
			--mount --uts --ipc --net \
			--pid --mount-proc \
			--root="$NEWROOT" \
			$CMD
		;;

	*)
		echo "ignoring unsupported: $1"
		;;

esac
