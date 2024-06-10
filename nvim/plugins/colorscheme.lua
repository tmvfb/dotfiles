require('pckr').add {
  "savq/melange-nvim",
  'marko-cerovac/material.nvim',
  {
    'catppuccin/nvim',
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
}
