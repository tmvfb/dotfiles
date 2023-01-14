local present = pcall(require, "material")
if not present then
  return
end

vim.g.material_style = "palenight"
vim.cmd 'colorscheme material'
