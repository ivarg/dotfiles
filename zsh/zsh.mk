# Set up prezto zsh

PREZTO_HOME = ${DOTFILES}/zsh/prezto
PREZTO_GIT_REMOTE = $(shell git -C ${PREZTO_HOME} remote get-url origin)
PREZTO_GIT_BRANCH = ivar

.PHONY: zsh _prezto _check_zsh_files
.SILENT: zsh _prezto

# We require these files or symlinks to be absent
ZSH_FILES = ${DOT_HOME}/.zlogin \
			${DOT_HOME}/.zlogout \
			${DOT_HOME}/.zpreztorc \
			${DOT_HOME}/.zprofile \
			${DOT_HOME}/.zshenv \
			${DOT_HOME}/.zshrc \
			${DOT_HOME}/.zprezto 

_check_zsh_files:
	$(foreach file, $(ZSH_FILES), \
		$(if $(wildcard $(file)), \
		$(error $(file): File exists)))


_prezto:
	echo "Checking out branch '${PREZTO_GIT_BRANCH}' of prezto (${PREZTO_GIT_REMOTE}) at ${PREZTO_HOME}"
	git -C ${PREZTO_HOME} checkout ${PREZTO_GIT_BRANCH}
	git -C ${PREZTO_HOME} submodule update --init
	ln -s ${PREZTO_HOME}/runcoms/zlogin ${DOT_HOME}/.zlogin
	ln -s ${PREZTO_HOME}/runcoms/zlogout ${DOT_HOME}/.zlogout
	ln -s ${PREZTO_HOME}/runcoms/zpreztorc ${DOT_HOME}/.zpreztorc
	ln -s ${PREZTO_HOME}/runcoms/zprofile ${DOT_HOME}/.zprofile
	ln -s ${PREZTO_HOME}/runcoms/zshenv ${DOT_HOME}/.zshenv
	ln -s ${PREZTO_HOME}/runcoms/zshrc ${DOT_HOME}/.zshrc
	ln -s ${PREZTO_HOME} ${DOT_HOME}/.zprezto
	ln -s ${DOTFILES}/zsh/secrets ${DOT_HOME}/.secrets


zsh: _check_zsh_files _prezto ## Setup zsh 
	echo "Installing zsh dotfiles at ${DOT_HOME} with ${SHELL}"
