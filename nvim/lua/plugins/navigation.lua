return {
  {
    'nvim-pack/nvim-spectre', -- powerful plugin for search
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    'nvim-tree/nvim-tree.lua',       -- tree on the left (g? for help)
    dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    config = function() require('nvim-tree').setup() end
  };

  {
    'nvim-telescope/telescope.nvim',
    config = function()
      -- require('telescope').load_extension('fzf')
      -- require('refactoring').setup()
      -- require('telescope').load_extension('refactoring')

      -- local trouble = require("trouble.providers.telescope")

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

}
