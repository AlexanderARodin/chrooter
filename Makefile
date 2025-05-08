include scripts/.config

help:
	@cat Makefile

allin: newroot corebox copy.init initrd image

edit:
	@nvim scripts/xx10-corebox.sh

run:
	@scripts/run-container.sh --unshare-user \
		'target/current-root' '/bin/sh'

# #######################################
# testing
chroot:
	@scripts/run-container.sh --chroot \
		'target/current-root' '/bin/sh'
unshare.root:
	@scripts/run-container.sh --unshare-root \
		'target/current-root' '/bin/sh'
unshare.user:
	@scripts/run-container.sh --unshare-user \
		'target/current-root' '/bin/sh'

chroot.install:
	@scripts/run-container.sh --chroot \
		'target/current-root' '/install'

# #######################################
# create root
copy.init:
	@scripts/xx50-install-init.sh
corebox:
	@export BUSYBOX=$(BUSYBOX) export UUTILS=$(UUTILS) \
		&& scripts/xx10-corebox.sh
newroot:
	@scripts/xx01-create-empty-root.sh

clean:
	@scripts/xx00-cleanup.sh

# #######################################
# build initrd OR image
initrd: 
	@./scripts/xx99-build-initrd.sh
image: 
	@./scripts/xx99-build-image.sh

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
