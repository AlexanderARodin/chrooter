#!/bin/bash
set -e

cd target/current-root
# #########################
# delete inits
rm -vf init


# #########################
# INIT of type
cp -vf ../../assets/$1 init
chmod -v +x init




# #########################
# #########################
# #########################
# Debugs for Only
	cp -vf ../../assets/dbg.sh dbg.sh
	chmod -v +x dbg.sh

	cp -vf ../vifm.tcz vifm.tcz
# #########################
# #########################
