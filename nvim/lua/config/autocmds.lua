-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 }) end })

vim.cmd [[
  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    autocmd FileType ruby,eruby,yaml,javascript,typescript set ai sw=2 sts=2 et
    autocmd FileType java set ai sw=4 sts=4 et
    autocmd FileType htmldjango set expandtab sw=2 sts=2 et
  augroup END
]]
