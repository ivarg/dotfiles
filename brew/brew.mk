# Set up Homebrew
# Prerequisites: ruby

.PHONY: brew
#.SILENT: brew

brew_install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle --file=${DOTFILES}/brew/Brewfile

brew: brew_install ## Install Homebrew
