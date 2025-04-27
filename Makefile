help:
	@cat Makefile

edit:
	#@nvim scripts/run-microvm.sh

run:
	#@./scripts/run-microvm.sh

# #######################################
# testing
shell.root:
	@./scripts/xxsr-chroot-shell-root.sh
shell.user:
	@./scripts/xxsu-chroot-shell-user.sh

mounted.root:
	@./scripts/xxmr-chroot-mounted-root.sh
mounted.user:
	@./scripts/xxmu-chroot-mounted-user.sh
	

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
