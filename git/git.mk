# Set up git

GIT_DIR = ${DOTFILES}/git

.PHONY: git 
.SILENT: git

git: ## Set up git
	ln -s ${GIT_DIR}/gitignore ${DOT_HOME}/.gitignore
	ln -s ${GIT_DIR}/gitconfig ${DOT_HOME}/.gitconfig
