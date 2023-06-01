## Requirements

* Linux or Mac
* git (for automatic installation)
* make (for automatic installation)
* [Nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim) (version >= 0.4.4)

## Recommendations

* [Oh My Zsh!](https://github.com/ohmyzsh/ohmyzsh)

## Setup

```
clone repository
make install # same when updating

# configure nvim
make nvim-configure

# install all additional packages for languages (See Makefile for install packages for some language)
make deps-install
```

## VIM

Run `:PackerSync` after each pulling (git pull)

### Main

* Use `<ctrl> + [` instead of `<Esc>`
* `<leader>` – Space

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
* `<leader> s` – search & replace

### Code editing and code navigation

* `<leader>:` - toggle Trouble (errors description)
* `<leader>p` - :set paste
* `<leader>pp` - :set nopaste
* `gcc` – toggle commenting
* `gf` – open a file corresponding to a word under the cursor
* `gd` – go to definition
* `g;` – go to the last edited line in the current opened buffer
* `gv` – reselect last visual selection
* `]g` and `[g` – go through diagnostics
* `]<leader>` and `[<leader>` – add empty line above and under cursor
* `<leader>ca` – show code actions
