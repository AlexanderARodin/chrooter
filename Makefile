help:
	@cat Makefile

edit:
	#@nvim scripts/run-microvm.sh

run:
	#@./scripts/run-microvm.sh

# #######################################
# testing
chroot:
	@./scripts/xxxx-chroot.sh /bin/sh

chroot.install:
	@./scripts/xxxx-chroot.sh /install

unshare.root:
	@./scripts/xxxx-unshare-from-root.sh /bin/sh

unshare.user:
	@./scripts/xxxx-unshare-from-user.sh /bin/sh
	

newroot: clean
	@echo '[NEW minimal ROOT]'
	@./scripts/xx10-coreutils+.sh

clean:
	@echo '[CLEAN NEWROOT]'
	@./scripts/xx00-wipeoff-newroot.sh


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
