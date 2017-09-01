#SHELL := /bin/bash
DOT_HOME ?= ${HOME}
DOTFILES ?= ${DOT_HOME}/dotfiles

.DEFAULT_GOAL := help

.PHONY: vim 
.SILENT: vim

help: 
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


include zsh/zsh.mk
include vim/vim.mk

