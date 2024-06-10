-- https://github.com/nanotee/nvim-lua-guide

vim.loader.enable()

require('config.settings')
require('plugins.init')
require('config.autocmds')
require('config.keymappings')
require('config.functions')  -- move functions here after all modules are loaded

require('nvim-tree').setup()
