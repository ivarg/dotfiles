# Set up Karabiner configuration file

.PHONY: karabiner
.SILENT: karabiner
KARABINER_CONFIG = ${DOT_HOME}/.config/karabiner
KARABONER_FILE = ${KARABINER_CONFIG}/karabiner.json 

karabiner: ## Set up Karabiner
	mkdir -p ${DOT_HOME}/.config/karabiner
	rm -f ${KARABINER_CONFIG}/karabiner.json
	echo "> Linking Karabiner config to ${KARABINER_CONFIG}/karabiner.json"
	ln -s ${DOTFILES}/karabiner/karabiner.json "${KARABINER_CONFIG}"
