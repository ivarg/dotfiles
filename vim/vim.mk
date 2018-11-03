# Install and set up neovim
# Dependencies: Homebrew, git

VIM_DIR := ${DOTFILES}/vim
VIM_CONFIG := ${DOT_HOME}/.config/nvim

# TODO: setup mattn/gist-vim, see :h gist-vim-setup
# TODO: set ctrl-h to send escape sequence in iterm prefs (https://github.com/neovim/neovim/issues/2048#issuecomment-98307896) [workaround for bug]

.SILENT: ctags powerline vim_plug neovim

ctags:
	echo "> Installing ctags"
	brew install ctags

powerline:
	echo "> Installing powerline fonts"
	$(if $(wildcard ${VIM_DIR}/fonts), rm -rf ${VIM_DIR}/fonts,)
	git -C ${VIM_DIR} clone https://github.com/powerline/fonts.git --depth=1
	${VIM_DIR}/fonts/install.sh
	rm -rf ${VIM_DIR}/fonts
	echo "> Done installing powerline fonts"

vim_plug:
	echo "> Installing vim plug"
	curl -fLo ${VIM_CONFIG}/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +q

neovim:
	echo "> Installing neovim"
	brew install neovim
	echo "> Done installing neovim"

vim: neovim ctags powerline vim_plug ## Install and set up Neovim
	echo "> Linking init.vim"
	ln -s ${DOTFILES}/vim/vimrc ${VIM_CONFIG}/init.vim 

