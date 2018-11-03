# Set up prezto zsh
# Dependencies: git

PREZTO_HOME = ${DOTFILES}/zsh/prezto
PREZTO_GIT_REMOTE = "https://github.com/ivarg/prezto.git"
PREZTO_GIT_BRANCH = ivar

.PHONY: zsh prezto check_zsh_files
.SILENT: zsh prezto

# We require these files or symlinks to be absent
ZSH_FILES = ${DOT_HOME}/.zlogin \
			${DOT_HOME}/.zlogout \
			${DOT_HOME}/.zpreztorc \
			${DOT_HOME}/.zprofile \
			${DOT_HOME}/.zshenv \
			${DOT_HOME}/.zshrc \
			${DOT_HOME}/.zcompdump \
			${DOT_HOME}/.zprezto 

check_zsh_files:
	rm -rf ${ZSH_FILES}


prezto:
	echo "> Checking out branch '${PREZTO_GIT_BRANCH}' of prezto (${PREZTO_GIT_REMOTE}) at ${PREZTO_HOME}"
	rm -rf ${PREZTO_HOME}
	git -C ${DOTFILES}/zsh clone --branch ${PREZTO_GIT_BRANCH} ${PREZTO_GIT_REMOTE}
	git -C ${PREZTO_HOME} checkout ${PREZTO_GIT_BRANCH}
	git -C ${PREZTO_HOME} submodule update --init
	ln -s ${PREZTO_HOME}/runcoms/zlogin ${DOT_HOME}/.zlogin
	ln -s ${PREZTO_HOME}/runcoms/zlogout ${DOT_HOME}/.zlogout
	ln -s ${PREZTO_HOME}/runcoms/zpreztorc ${DOT_HOME}/.zpreztorc
	ln -s ${PREZTO_HOME}/runcoms/zprofile ${DOT_HOME}/.zprofile
	ln -s ${PREZTO_HOME}/runcoms/zshenv ${DOT_HOME}/.zshenv
	ln -s ${PREZTO_HOME}/runcoms/zshrc ${DOT_HOME}/.zshrc
	ln -s ${PREZTO_HOME} ${DOT_HOME}/.zprezto


zsh: check_zsh_files prezto ## Set up zsh 

