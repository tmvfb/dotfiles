#!/usr/bin/env bash

set -e

case "$OSTYPE" in
  linux*)
    add-apt-repository -y ppa:neovim-ppa/stable
    apt-get update
    apt install -yy zsh git neovim make neovim git \
      silversearcher-ag ripgrep fd-find fzf bat htop ncdu \
      tldr httpie exuberant-ctags zip build-essential pip tmux

    chsh -s /bin/zsh

    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 || true
    # echo ". \$HOME/.asdf/asdf.sh" > ~/.oh-my-zsh/custom/asdf.zsh
    echo "alias fixssh='eval \$(tmux showenv -s SSH_AUTH_SOCK)'" > ~/.oh-my-zsh/custom/useful.zsh

    # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
    apt install -yy patch libyaml-dev libreadline6-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

    # https://github.com/asdf-community/asdf-php/blob/master/.github/workflows/workflow.yml
    apt install -yy autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev

    update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100

    apt install -yy shellcheck

    ;;
  darwin*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    yes | brew install asdf neovim git the_silver_searcher fzf bat htop fd ncdu tldr httpie git-delta ripgrep gnu-sed tmux
    yes | brew install pandoc actionlint shellcheck checkmake lazygit tig thefuck tree tokei yq jq wget
    yes | brew install lua nodejs golang
    yes | brew install --cask temurin rectangle unnaturalscrollwheels iterm2 ctags

  # https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
  ;;
*)
  echo 'Everything is ready. Go to the next step'
  ;;
esac

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
echo "alias fixssh='eval \$(tmux showenv -s SSH_AUTH_SOCK)'" >~/.oh-my-zsh/custom/useful.zsh

asdf plugin add nodejs || true
asdf plugin add golang || true
asdf plugin add java || true
asdf plugin add python || true
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git || true

asdf install lua latest
asps global lua latest

asdf install nodejs latest
asdf global nodejs latest

asdf install golang latest
asdf global golang latest

asdf install python latest
asdf global python latest

asdf install java openjdk-19.0.1
asdf global java openjdk-19.0.1

# if already existed
if ! asdf update; then
    echo "ASDF update failed. Attempting to upgrade via brew..."
    brew upgrade asdf
fi
asdf plugin update --all

REPO="$HOME/.oh-my-zsh/custom/plugins/you-should-use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$REPO" || true
git -C "$REPO" pull

# sed -i'.bak' 's/^plugins=.*$/plugins=(git asdf vi-mode fzf docker docker-compose you-should-use)/' ~/.zshrc
sudo ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
rm ~/.zshrc
sudo ln -s ~/dotfiles/.zshrc ~/.zshrc
