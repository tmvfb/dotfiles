require('pckr').add {
  'tpope/vim-sensible',             -- basic config for nvim
  'nvim-lua/plenary.nvim',          -- basic config for nvim
  'nvim-tree/nvim-web-devicons',    -- icons for nvim

  'svban/YankAssassin.vim',         -- leaves cursor after yank
  'tpope/vim-repeat',               -- repeat whole pattern instead of only last command
  'tpope/vim-unimpaired',           -- a few new mappings
  'tpope/vim-sleuth',               -- tab width
  'tpope/vim-surround',             -- powerful plugin to add brackets
  'ntpeters/vim-better-whitespace', -- trailing
  'dyng/ctrlsf.vim',                -- editing files in place during search
  'mbbill/undotree',                -- advanced undo

  {
    'nvim-zh/auto-save.nvim',       -- some weird fork
    config = function()
      local autosave = require("auto-save")
      autosave.setup()
    end
  },
  {
    "folke/which-key.nvim",         -- popups with key suggestions
    config = function()
      require("which-key").setup()
    end
  },
}
