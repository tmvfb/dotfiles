return {
  { "savq/melange-nvim", lazy = true },
  { 'marko-cerovac/material.nvim', lazy = true },
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
  { "shaunsingh/nord.nvim", lazy = true },
}
