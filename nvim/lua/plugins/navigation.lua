return {
  {
    'nvim-pack/nvim-spectre', -- powerful plugin for search
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    'nvim-tree/nvim-tree.lua',                    -- tree on the left (g? for help)
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    config = function() require('nvim-tree').setup() end
  },

  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    config = function()
      -- require('telescope').load_extension('fzf')
      -- trouble = require("trouble.providers.telescope")

      require('telescope').setup {
        defaults = {
          sorting_strategy = "ascending",
          mappings = {
            -- restore default behavior
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              -- ["<c-t>"] = trouble.open_with_trouble
            },
            n = {
              -- ["<c-t>"] = trouble.open_with_trouble
            }
          },
        },
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            sort_mru = true
          }
        },
      }
    end,
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    event = "VeryLazy",
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
}
