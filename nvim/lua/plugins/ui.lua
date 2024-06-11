require("pckr").add {
  {
    'goolord/alpha-nvim', -- greet screen
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },

  {
    "willothy/nvim-cokeline", -- bufferline
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "stevearc/resession.nvim"
    },
    config = function()
      require('cokeline').setup()
    end
  },

  {
    'freddiehaddad/feline.nvim', -- statusline
    after = "nvim-web-devicons",
    config = function()
      require('feline').setup({
        -- preset = 'noicon'
      })
    end
  },

  {
    'kosayoda/nvim-lightbulb', -- show lightbulb if actions available (F4, covered by lsp-zero)
    config = function()
      local lightbulb = require('nvim-lightbulb')
      lightbulb.setup({ autocmd = { enabled = true } })
    end
  },

  {
    'stevearc/dressing.nvim', -- improve ui
    config = function()
      local dressing = require('dressing')
      dressing.setup({
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
    config = function()
      require("ibl").setup()
    end
  },
}

