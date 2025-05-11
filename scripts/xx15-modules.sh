#!/bin/bash
set -e

# #########################
# re-install modules
echo "[ENTER ROOT DIR]"
cd target/current-root
cp -vrf ../modules-import/lib ./
