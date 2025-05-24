include scripts/.config

help:
	@cat Makefile

# #######################################
# dev
allin: newroot corebox modules initrd sqsh.image

edit:
	@nvim assets/dbg.sh

run: chroot-init
	@scripts/run-container.sh --unshare-user \
		'target/current-root' '/init'

# #######################################
# testing
chroot.hardcore:
	@scripts/run-container.sh --chroot \
		'target/current-root' '/bin/sh'
unshare.root: chroot-init
	@scripts/run-container.sh --unshare-root \
		'target/current-root' '/init'
unshare.user: chroot-init
	@scripts/run-container.sh --unshare-user \
		'target/current-root' '/init'


# #######################################
# fill the root
system-init:
	@scripts/xx80-reinstall-init.sh min-init
chroot-init:
	@scripts/xx80-reinstall-init.sh chroot-init

modules:
	@scripts/xx15-modules.sh
reimport-modules:
	@rm -rvf target/modules-import/*
	@#cd ../linux-kernel && make modules_install INSTALL_MOD_PATH=../chrooter/target/modules-import/
	@cd ../linux-6.12.27 && make modules_install INSTALL_MOD_PATH=../chrooter/target/modules-import
	@rm -vf target/modules-import/lib/modules/6.12.27/build

corebox:
	@export BUSYBOX=$(BUSYBOX) export UUTILS=$(UUTILS) \
		&& scripts/xx10-corebox.sh
newroot:
	@scripts/xx01-create-empty-root.sh

clean:
	@scripts/xx00-cleanup.sh

# #######################################
# build initrd OR image
initrd: system-init
	@scripts/xx99-build-initrd.sh
sqsh.image: chroot-init
	@scripts/xx99-build-image.sh

# # # # # # # #
pull:
	@git pull
savetogit: git.pushall
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .
