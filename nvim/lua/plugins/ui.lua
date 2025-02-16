return {
  'kevinhwang91/nvim-bqf', -- quickfix

  {
    'goolord/alpha-nvim', -- greet screen
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  {
    "willothy/nvim-cokeline", -- bufferline
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "stevearc/resession.nvim"
    },
    config = function() require('cokeline').setup() end
  },

  {
    'nvim-lualine/lualine.nvim', -- statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },

  {
    'kosayoda/nvim-lightbulb', -- show lightbulb if actions available
    event = "VeryLazy",
    config = function()
      require('nvim-lightbulb').setup({
        autocmd = { enabled = true }
      })
    end
  },

  {
    'lukas-reineke/indent-blankline.nvim', -- indentation vertical lines
    event = "VeryLazy",
    config = function() require("ibl").setup() end
  },

  {
    'preservim/tagbar', -- file structure nav
    event = "VeryLazy",
  },

  {
    'szw/vim-maximizer', -- tmux-like win maximizer
    event = "VeryLazy",
    init = function()
      vim.g.maximizer_default_mapping_key = '<C-w>z'
    end
  },

  {
    "folke/snacks.nvim", -- mostly improved ui
    priority = 1000,
    lazy = false,
    opts = {
      gitbrowse = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      rename = { enabled = true },
      terminal = { enabled = true },
    },
  }
}
