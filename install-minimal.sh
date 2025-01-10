#!/usr/bin/env bash

set -e

add-apt-repository -y ppa:neovim-ppa/stable
apt-get update
apt install -yy zsh git neovim make \
  silversearcher-ag ripgrep fd-find fzf bat htop ncdu \
  tldr httpie exuberant-ctags zip build-essential pip tmux
apt install -yy git-delta pandoc actionlint checkmake lazygit tig thefuck tree tokei

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

echo "alias fixssh='eval \$(tmux showenv -s SSH_AUTH_SOCK)'" > ~/.oh-my-zsh/custom/useful.zsh

rm ~/.zshrc
sudo ln -s ~/dotfiles/.zshrc ~/.zshrc
