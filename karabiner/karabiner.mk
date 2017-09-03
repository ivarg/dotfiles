# Set up Karabiner configuration file

.PHONY: karabiner
.SILENT: karabiner

karabiner: ## Set up Karabiner
	ln -s ${DOTFILES}/karabiner/KeyRemap4MacBook.xml "${DOT_HOME}/Library/Application Support/Karabiner/private.xml"
