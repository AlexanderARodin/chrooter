#!/bin/sh

echo 'started ..'

qemu-system-x86_64-microvm \
	-machine accel=kvm \
	-bios /usr/share/qemu/qboot.rom \
	-m 512M \
	-kernel target/vmlinuz64 \
	-initrd target/corepure64.gz \
	-append "earlyprintk=ttyS0 console=ttyS0 showapps text" \
	-enable-kvm -smp 2 -nographic \
	>> target/qemu_raa.log

echo '.. ended'

