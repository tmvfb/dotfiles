-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })

-- YankAssassin
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.opt.cursorline = false end,
})
