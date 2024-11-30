## Requirements

* Linux or Mac
* git (for automatic installation)
* make (for automatic installation)
* [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh)


## Setup

```
# clone repository
make install # same when updating

# configure nvim
make nvim-configure

# install all additional packages for languages (See Makefile to install packages for some language)
make deps-install
```

## Neovim
Is installed with install.sh script. **Manually setup latest Linux neovim release:**
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo ln -s $HOME/nvim.appimage $HOME/.local/bin/nvim
```

Run `:Lazy` and update, also `:MasonUpdate` to update the packages and LSP dependencies.

### Main

* Use `<ctrl> + [` instead of `<Esc>`
* `<leader>` – Space
* See `:help unimpaired` for some fancy keymaps

### Navigation

#### Moving between visible buffers

* `<C-h>` – move left or open new left split
* `<C-l>` – move right or open new right split
* `<C-k>` – move up or open new top split
* `<C-j>` – move down or open new bottom split

#### Lists

* `<ctrl> n` – next item
* `<ctrl> p` – previous item

#### Visual mode

* `K` - move selection up
* `J` - move selection down

### File Tree

* `<leader><leader>` – toggle filetree
* `<C-n>` – locate opened file in the filetree
* `o` – open directory or file

### Searching and Navigation

* `<leader> sf` – find files
* `<leader> sg` – git grep
* `<leader> sc` – find commits
* `<leader> so` – symbols
* `<leader> sr` – references
* `<leader> b` – show buffer list

### Code editing and code navigation

* `gcc` – toggle commenting
* `gf` – open a file corresponding to a word under the cursor
* `gx` – open a link corresponding to a word under the cursor
* `gd` – go to definition
* `g;` – go to the last edited line in the current opened buffer
* `gv` – reselect last visual selection
* `]d` and `[d` – go through diagnostics
* `]<leader>` and `[<leader>` – add empty line above and under cursor
* `<leader>ca` – show code actions
* `<leader><leader>` – show code actions in visual mode
* `<leader>f` - format code
* `<leader>rr` - refactor code in visual mode
* `<leader>rn` - LSP rename
* `<leader>pr` - rename with spectre
* `vim-surround` is enabled, check key binds in their repo

### Sessions
* `<leader>ss` to save session
* `<leader>ss` to load session

### Tools and scripts
* `<leader>lg` lazygit
* `<leader>tb` tagbar
* `<C-a>` alpha
* `<leader>hp` toggle current chunk git diff
* `gp` insert python script

## Misc
Add to .zshrc/.bashrc:
  
```sh
export PATH="$HOME/.local/bin:$PATH"
export FZF_BASE="/usr/bin/fzf"
```
