# Install and set up Iterm2

ITERM2_DIR = ${DOTFILES}/iterm2


.PHONY: iterm2 iterm2_install
.SILENT: iterm2 iterm2_install

iterm2_install:
	echo ">>> Installing Iterm2"
	brew install iterm2

iterm2: iterm2_install ## Set up Iterm2
	echo ">>> Setting up Iterm2"
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${ITERM2_DIR}"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

