-- https://github.com/nanotee/nvim-lua-guide

vim.loader.enable()

require('functions')
-- require('config')
require('settings')
require('colorscheme')
require('autocmds')
require('plugins.init')
require('keymappings')

require("nvim-tree").setup()
