#!/bin/bash
set -e
. scripts/.lib

# INIT
sudo cp -vf assets/min-init $NEWROOT/init
sudo chmod +x $NEWROOT/init
