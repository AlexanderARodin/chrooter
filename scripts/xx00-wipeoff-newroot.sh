#!/bin/bash
set -e
set -x
#. scripts/.lib

mktemp -p /tmp chrooter.XX
cd target/$ROOTDIR
ls -lah
#sudo rm -Rfv tartget/$NEWROOT/*
#sudo rm -fv tartget/$NEWROOT/../initrd.gz
