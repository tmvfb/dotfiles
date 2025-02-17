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
    },
    config = function() require('cokeline').setup() end
  },

  {
    'nvim-lualine/lualine.nvim', -- statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        extensions = { 'nvim-tree', 'fugitive' }
      }
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
  },

  {
    "folke/noice.nvim", -- cool ui for everything
    event = "VeryLazy",
    opts = {},
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        presets = {
          bottom_search = true,   -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
        },
        routes = {
          {
            filter = {
              event = "lsp",
              kind = "progress",
              -- cond = function(message)
              --   local client = vim.tbl_get(message.opts, "progress", "client")
              --   return client == "null-ls"
              -- end,
            },
            opts = { skip = true },
          },
        },
      })
    end
  },

}
