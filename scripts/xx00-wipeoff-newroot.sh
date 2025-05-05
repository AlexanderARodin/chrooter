#!/bin/bash
set -e
set -x
. scripts/.lib

sudo rm -Rfv $NEWROOT/*
sudo rm -fv $NEWROOT/../initrd.gz
