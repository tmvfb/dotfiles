all: install nvim-configure deps

TAGS := all

PACKER_PATH=~/.local/share/nvim/site/pack/pckr/start

install:
	./install.sh

nvim-configure:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	rm -rf $(PACKER_PATH) || exit 0
	mkdir -p ~/.config
	mkdir -p $(PACKER_PATH)
	git clone --depth 1 https://github.com/lewis6991/pckr.nvim $(PACKER_PATH)/pckr.nvim
	ln -snf $(PWD)/nvim ~/.config/nvim
	# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

deps-install: deps-npm deps-pip deps-go

deps-pip:
	pip3 install --upgrade pynvim
	pip3 install --upgrade vim-vint spellcheck yamllint codespell
	pip3 install --upgrade autopep8 flake8 bandit pytype black

deps-npm:
	npm install -g neovim
	npm install -g prettier eslint @babel/eslint-parser eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -yg eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm install -g yaml-language-server markdownlint bash-language-server jsonlint
	npm install -g dockerfile-language-server-nodejs

deps-go:
	go install honnef.co/go/tools/cmd/staticcheck@latest
	GO111MODULE=on go install golang.org/x/tools/gopls@latest

# nvim-log:
# 	tail -f kjj
