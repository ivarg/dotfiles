#SHELL := /bin/bash
DOT_HOME ?= ${HOME}
DOTFILES ?= ${DOT_HOME}/dotfiles

.DEFAULT_GOAL := help

.PHONY: vim 
.SILENT: vim

help: ## Display this help message
	@cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

vim: ## Set up neovim
	echo "Setting up vim with ${SHELL}"

include zsh/zsh.mk

