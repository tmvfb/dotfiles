return {
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
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('lualine').setup()
      end
  },

  {
    'kosayoda/nvim-lightbulb', -- show lightbulb if actions available (F4, covered by lsp-zero)
    event = "VeryLazy",
    config = function()
      require('nvim-lightbulb').setup({
        autocmd = { enabled = true }
      })
    end
  },

  {
    'stevearc/dressing.nvim', -- improve ui
    event = "VeryLazy",
    config = function()
      require('dressing').setup({
        input = {
          get_config = function()
            if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
              return { enabled = false }
            end
          end,
        },
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
}
