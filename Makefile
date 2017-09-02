DOT_HOME ?= ${HOME}
DOTFILES := $(shell pwd)

.DEFAULT_GOAL := help

.PHONY: vim 
.SILENT: vim

help: 
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


include zsh/zsh.mk
include vim/vim.mk
include brew/brew.mk
include tmux/tmux.mk
include git/git.mk
include iterm2/iterm2.mk

all: brew ## Install dotfiles
