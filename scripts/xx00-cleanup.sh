#!/bin/bash
set -e

echo '[CLEAN]'
rm -Rf target/root-????
rm -Rfv target/root-????.gz
rm -Rfv target/root-????.sqsh

rm -fv target/current-root
rm -fv target/current-initrd.gz
rm -fv target/current-image.sqsh
