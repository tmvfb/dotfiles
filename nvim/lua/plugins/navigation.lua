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
    config = function()
      require('nvim-tree').setup {
        actions = {
          open_file = {
            resize_window = false  -- don't resize nvim-tree on file open
          }
        },
      }
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    config = function()
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
      require("telescope").load_extension("noice")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      -- trouble = require("trouble.providers.telescope")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim', -- speed up telescope
    lazy = true,
    build = 'make',
  },

  {
    'nvim-telescope/telescope-ui-select.nvim', -- replacement for dressing.nvim
    lazy = true,
  }

}
