return {
  -- https://github.com/RRethy/nvim-treesitter-textsubjects
  {
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function() require("refactoring").setup() end,
  },

  -- function/class annotation generator
  {
    'danymat/neogen',
    event = "VeryLazy",
    config = function() require('neogen').setup() end,
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/nvim-cmp',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({
        check_ts = true
      })
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        autotag = {
          enable = true,
        },
        matchup = {
          enable = true
        },
        highlight = {
          enable = true, -- false will disable the whole extension
        },
        indent = {
          enable = true
        },
        endwise = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
          select = {
            enable = true,
            include_surrounding_whitespace = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      }
    end
  },

  { 'nvim-treesitter/nvim-treesitter-textobjects', event = "VeryLazy" },
  { 'RRethy/nvim-treesitter-endwise', event = "VeryLazy" },
  { 'windwp/nvim-ts-autotag', event = "VeryLazy" },
  { 'andymass/vim-matchup', event = "VeryLazy" },
  { 'JoosepAlviste/nvim-ts-context-commentstring', event = "VeryLazy" },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = "VeryLazy",
    config = function()
      require 'treesitter-context'.setup {
        separator = '-'
      }
    end
  },
}
