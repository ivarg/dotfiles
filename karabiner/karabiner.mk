# Set up Karabiner configuration file

.PHONY: karabiner
.SILENT: karabiner

karabiner: ## Set up Karabiner
	mkdir -p ${DOT_HOME}/.config/karabiner
	ln -s ${DOTFILES}/karabiner/karabiner.json "${DOT_HOME}/.config/karabiner"
