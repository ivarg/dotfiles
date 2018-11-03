# Set up git

GIT_DIR = ${DOTFILES}/git

.PHONY: git 
.SILENT: git

git: ## Set up git
	echo "> Remove old gitignore and gitconfig ${DOT_HOME}"
	rm -f ${DOT_HOME}/.gitignore
	rm -f ${DOT_HOME}/.gitconfig
	echo "> Linking gitignore and gitconfig"
	ln -s ${GIT_DIR}/gitignore ${DOT_HOME}/.gitignore
	ln -s ${GIT_DIR}/gitconfig ${DOT_HOME}/.gitconfig
