#!/usr/bin/env bash

set -e

case "$OSTYPE" in
  linux*)
    add-apt-repository -y ppa:neovim-ppa/stable
    apt-get update
    apt install -yy zsh neovim make \
      silversearcher-ag ripgrep fd-find fzf bat htop ncdu \
      tldr httpie exuberant-ctags zip build-essential pip tmux
    apt install -yy git-delta pandoc actionlint checkmake lazygit tig thefuck tree tokei

    chsh -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
    echo "alias fixssh='eval \$(tmux showenv -s SSH_AUTH_SOCK)'" > ~/.oh-my-zsh/custom/useful.zsh

    apt install -yy build-essential curl libffi-dev libssl-dev libsqlite3-dev zlib1g-dev libpq-dev libmysqlclient-dev openssl

    update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100

    apt install -yy shellcheck

    ;;
  darwin*)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    yes | brew install neovim git the_silver_searcher fzf bat htop fd ncdu tldr httpie git-delta ripgrep gnu-sed tmux
    yes | brew install pandoc actionlint shellcheck checkmake lazygit tig thefuck tree tokei yq jq wget
    yes | brew install lua nodejs golang universal-ctags

    brew install alfred
    yes | brew install --cask font-meslo-lg-nerd-font || true
    yes | brew install --cask temurin rectangle unnaturalscrollwheels iterm2
  ;;
*)
  echo 'Everything is ready. Go to the next step'
  ;;
esac

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
echo "alias fixssh='eval \$(tmux showenv -s SSH_AUTH_SOCK)'" >~/.oh-my-zsh/custom/useful.zsh

REPO="$HOME/.oh-my-zsh/custom/plugins/you-should-use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$REPO" || true
git -C "$REPO" pull


# # misc asdf stuff
# case "$OSTYPE" in
#   linux*)
#     git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 || true
#     # echo ". \$HOME/.asdf/asdf.sh" > ~/.oh-my-zsh/custom/asdf.zsh
#     ;;
#   darwin*)
#     yes | brew install asdf
#   ;;
# *)
#   echo 'asdf configured'
#   ;;
# esac
#
# asdf plugin add nodejs || true
# asdf plugin add golang || true
# asdf plugin add java || true
# asdf plugin add python || true
# asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git || true
#
# install_asdf_version() {
#   lang=$1
#   version=$2
#
#   latest_version=$(asdf latest "$lang")
#
#   if (asdf list "$lang" | grep -q "$version") || (asdf list "$lang" | grep -q $latest_version); then
#     echo "$lang version $version is already installed, skipping..."
#   else
#     echo "installing $lang version $version"
#     asdf install "$lang" "$version"
#     asdf global "$lang" "$version"
#   fi
# }
#
# install_asdf_version nodejs latest
# install_asdf_version golang latest
# install_asdf_version python latest
# install_asdf_version java openjdk-19.0.1
#
# # if already existed
# if ! asdf update; then
#     echo "ASDF update failed. Attempting to upgrade via brew..."
#     brew upgrade asdf
# fi
# asdf plugin update --all
