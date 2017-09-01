# Set up Homebrew
# Prerequisites: ruby

.PHONY: brew
#.SILENT: brew

brew_install:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_packages:
	brew install git-crypt
	brew install jq
	brew install python

brew: brew_install brew_packages ## Install Homebrew
