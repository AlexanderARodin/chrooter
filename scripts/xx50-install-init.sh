#!/bin/bash
set -e

# INIT
cd target/current-root
cp -vf ../../assets/min-init init
chmod -v +x init

# Debugs for Only
cp -vf ../../assets/dbg.sh dbg.sh
chmod -v +x dbg.sh

cp -vf ../vifm.tcz vifm.tcz
