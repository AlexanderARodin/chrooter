#!/bin/bash
set -e
ROOT_DIR_PATH="$2"
CMD="$3"

case $1 in
	--chroot)
		sudo chroot "$ROOT_DIR_PATH" "$CMD"
		;;

	--unshare-root)
		sudo unshare --fork \
			--mount --uts --ipc --net \
			--pid --mount-proc \
			--root="$ROOT_DIR_PATH" \
			"$CMD"
		;;

	--unshare-user)
		unshare --fork \
			-Ur \
			--mount --uts --ipc --net \
			--pid --mount-proc \
			--root="$ROOT_DIR_PATH" \
			"$CMD"
		;;

	--help)
		echo 'Usage: run-container.sh [opt] [root-dir [cmd]]'
		echo '    --help         : this help'
		echo '    --chroot       : sudo chroot         root-dir [cmd]'
		echo '    --unshare-root : sudo unshare ..     root-dir [cmd]'
		echo '    --unshare-user :      unshare -Ur .. root-dir [cmd]'
		;;

	*)
		echo "ignore unsupported: $1" >&2
		;;
esac
