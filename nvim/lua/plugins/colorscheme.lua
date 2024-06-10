require('pckr').add {
  {
    'catppuccin/nvim', -- colorscheme
    config = function()
      require("catppuccin").setup {
        color_overrides = {
          latte = {
            -- base = "#E8E8E8",
            -- mantle = "#BEBEBE",
            -- crust = "#474747",
          },
        }
      }
    end
  },
  "savq/melange-nvim",
  'marko-cerovac/material.nvim',
}

vim.cmd.colorscheme "catppuccin-mocha"

-- vim.opt.background = "light"
-- vim.cmd.colorscheme "melange"

-- vim.g.material_style = "palenight"
-- vim.cmd 'colorscheme material'
