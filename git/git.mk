# Set up git

GIT_DIR = ${DOTFILES}/git

.PHONY: git 
.SILENT: git

git: ## Set up git
	[ -e ${DOT_HOME}/.gitignore ] && rm ${DOT_HOME}/.gitignore
	[ -e ${DOT_HOME}/.gitconfig ] && rm ${DOT_HOME}/.gitconfig
	echo "> Linking gitignore and gitconfig"
	ln -s ${GIT_DIR}/gitignore ${DOT_HOME}/.gitignore
	ln -s ${GIT_DIR}/gitconfig ${DOT_HOME}/.gitconfig
