#!/bin/bash
set -e

# INIT
cd target/current-root
cp -vf ../../assets/min-init init
chmod -v +x init
