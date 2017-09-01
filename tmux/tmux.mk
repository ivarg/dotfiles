# Set up tmux
# Prerequisites: brew

TMUX_DIR = ${DOTFILES}/tmux

.PHONY: tmux
.SILENT: tmux

tmux_install:
	brew install tmux
	ln -s ${TMUX_DIR}/tmux.conf ${DOT_HOME}/.tmux.conf
	mkdir -p ${DOT_HOME}/.tmux
	ln -s ${TMUX_DIR}/tmuxline ${DOT_HOME}/.tmux/tmuxline

tpm_install:
	git clone https://github.com/tmux-plugins/tpm ${DOT_HOME}/.tmux/plugins/tpm

tmux: tmux_install tpm_install ## Install tmux
