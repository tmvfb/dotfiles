-- local present = pcall(require, "material")
-- if not present then
--   return
-- end
--
-- vim.g.material_style = "palenight"
-- vim.cmd 'colorscheme material'
--

require('pckr').add {
  {
    'catppuccin/nvim';  -- colorscheme
    config = function()
      require("catppuccin").setup {
        color_overrides = {
          latte = {
            base = "#E8E8E8",
            mantle = "#BEBEBE",
            -- crust = "#474747",
          },
        }
      }
    end
  };
}
vim.cmd.colorscheme "catppuccin-mocha"
