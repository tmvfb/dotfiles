-- https://github.com/nanotee/nvim-lua-guide

vim.loader.enable()

require('settings')
require('autocmds')
require('plugins.init')
require('keymappings')
require('functions')  -- move functions here after all modules are loaded
require('colorscheme')

require('nvim-tree').setup()
