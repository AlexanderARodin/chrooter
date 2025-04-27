#!/bin/bash
set -e

echo $(pwd)
. .config
. ./scripts/.lib

RemoveSystemVFS

sudo rm -Rfv $NEWROOT/*
