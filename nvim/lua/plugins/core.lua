return {
  'tpope/vim-sensible',             -- basic config for nvim
  'nvim-lua/plenary.nvim',          -- basic config for nvim plugins
  'nvim-tree/nvim-web-devicons',    -- icons for nvim

  'svban/YankAssassin.vim',         -- leaves cursor after yank
  'tpope/vim-repeat',               -- repeat whole pattern instead of only last command
  'tpope/vim-unimpaired',           -- a few new mappings
  'tpope/vim-sleuth',               -- tab width
  'tpope/vim-surround',             -- powerful plugin to add brackets
  'ntpeters/vim-better-whitespace', -- trailing
  'mbbill/undotree',                -- advanced undo
  'kevinhwang91/nvim-bqf',          -- quickfix
  -- 'dyng/ctrlsf.vim',                -- editing files in place during search

  {
    'okuuva/auto-save.nvim',       -- auto saving docs
    event = { "InsertLeave", "TextChanged" },
    config = function() require("auto-save").setup() end
  },
  {
    "folke/which-key.nvim",         -- popups with key suggestions
    event = "VeryLazy",
    config = function() require("which-key").setup() end
  },
  {
    "jpalardy/vim-slime",           -- interactive REPL
    event = "VeryLazy",
    init = function()
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = false
    end,
  },
}
