all: install nvim-configure deps

TAGS := all

install:
	./install.sh

nvim-configure:
	rm -rf nvim/plugin || exit 0
	rm -rf ~/.local/share/nvim || exit 0
	rm -rf ~/.config/nvim || exit 0
	mkdir -p ~/.config
	ln -snf $(PWD)/nvim ~/.config/nvim

	# sed -i'.bak' 's/^plugins=.*$/plugins=(git asdf vi-mode fzf docker docker-compose you-should-use)/' ~/.zshrc
	ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
	rm ~/.zshrc
	ln -s ~/dotfiles/.zshrc ~/.zshrc

deps-install: deps-npm deps-pip deps-go

deps-pip:
	pip3 install --upgrade --break-system-packages pynvim
	pip3 install --upgrade --break-system-packages vim-vint spellcheck yamllint codespell
	pip3 install --upgrade --break-system-packages autopep8 flake8 bandit pytype black

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
