-- https://github.com/lewis6991/pckr.nvim
-- https://github.com/nvim-lua/kickstart.nvim
-- https://github.com/ecosse3/nvim/blob/master/lua/config/plugins.lua

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('plugins.core');

require('plugins.colorscheme');
require('plugins.git');
require('plugins.lsp');
require('plugins.navigation');
require('plugins.specific');
require('plugins.treesitter');
require('plugins.ui');
