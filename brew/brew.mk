# Set up Homebrew
# Prerequisites: ruby

.PHONY: brew
#.SILENT: brew

brew_install:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle

brew: brew_install ## Install Homebrew
