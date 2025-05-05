include scripts/.config

help:
	@cat Makefile

edit:
	@nvim scripts/xx99-build-initrd.sh

run:
	@scripts/~run-microvm.sh~

# #######################################
# testing
chroot:
	@scripts/run-container.sh --chroot $(NEWROOT) /bin/sh
unshare.root:
	@scripts/run-container.sh --unshare-root $(NEWROOT) /bin/sh
unshare.user:
	@scripts/run-container.sh --unshare-user $(NEWROOT) /bin/sh

chroot.install:
	@./scripts/xxxx-chroot.sh /install


newroot: clean
	@echo '[NEW minimal ROOT]'
	@./scripts/xx10-coreutils+.sh
	@./scripts/xx50-install-init.sh

clean:
	@echo '[CLEAN NEWROOT]'
	@./scripts/xx00-wipeoff-newroot.sh

# #######################################
# build initrd
initrd: 
	@./scripts/xx99-build-initrd.sh

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
