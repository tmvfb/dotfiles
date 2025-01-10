local opts = { silent = true, noremap = true }
local bind = vim.keymap.set

bind("n", "<leader>h", ":nohlsearch<CR>", opts)
bind('n', '<leader>vr', ':so $MYVIMRC<CR>')

-- Better window movement
bind("n", "<C-l>", "<C-w>l", opts)
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)

bind("n", "k", "gk", opts)
bind("n", "j", "gj", opts)

-- for russian layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "л", "gk", opts)
bind("n", "о", "gj", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)

-- Move selected line / block of text in visual mode
bind("v", "K", ":move '<-2<CR>gv-gv", opts)
bind("v", "J", ":move '>+1<CR>gv-gv", opts)

-- Select current word and run command to replace it
-- bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- bind('v', '"y', '"+y', opts)
-- bind('n', '"y', '"+y', opts)
-- bind('n', '"Y', '"+Y', opts)
-- bind('n', '"p', '"+p', opts)
-- bind('n', '"P', '"+P', opts)

-- Save file by CTRL-S
-- keymap("n", "<C-s>", ":w<CR>", silent)
-- keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Buffers
-- bind("n", "bd", ":bd<CR>", opts)

-- Don't yank on delete char
-- bind("n", "d", '"_d', opts)
-- bind("n", "D", '"_D', opts)
-- bind("v", "d", '"_d', opts)
-- bind("v", "D", '"_D', opts)

-- Don't yank on visual paste
bind("v", "p", '"_dP', opts)

-- Quickfix
bind("n", "<leader>q", ":BqfToggle<CR>")

-- Refactor with spectre
bind("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
bind("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- Telescope buffers
bind("v",  "<leader>rr",  "<Esc><rmd>lua require('telescope').extensions.refactoring.refactors()<CR>", opts)
bind("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
bind("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
bind("n", "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
bind("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
bind("n", "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)
bind("n", "<leader>sc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
bind("n", "<leader>sr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
bind("n", "<leader>so", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
bind("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- NvimTree
bind('n', '<leader><leader>', ':NvimTreeToggle<CR>')
bind('n', '<C-n>', ':NvimTreeFindFile<CR>')

-- Microsoft Windows fixes
-- bind('n', '<leader>p', ':set paste<CR>', opts)
-- bind('n', '<leader>pp', ':set nopaste<CR>', opts)

-- dap bindings
-- bind("n", '<leader>t', "<cmd>lua require('dap').toggle_breakpoint() <CR>", opts)
-- bind("n", '<leader>dr', "<cmd>lua require('dap').continue()<CR>", opts)
-- bind("n", '<leader>dl', "<cmd>lua require('dap').run_last()<CR>", opts)
-- bind("n", '<leader>du', "<cmd>lua require('dapui').toggle() <CR>", opts)
-- bind("n", '<leader>dd', "<cmd>lua require('dapui').eval() <CR>", opts)

-- vim lsp bindings
bind('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
bind('n', '<leader>rn', vim.lsp.buf.rename, opts)
bind('n', '<leader>ca', vim.lsp.buf.code_action, opts)
bind('v', '<leader><leader>', vim.lsp.buf.code_action, opts)

-- misc
bind('n', "<leader>lg", "<cmd>LazyGit<cr>", opts)
bind('n', "gp", 'iif __name__ == "__main__":<Esc>o', opts)
bind('n', "<leader>hp", "V:Gitsigns preview_hunk_inline<CR>", opts)
bind('n', "<leader>tb", ":TagbarToggle<CR>", opts)
bind('n', "<C-p>", ":Alpha<CR>", opts)

-- sessions
bind('n', "<leader>ss", ":mksession! ~/.config/nvim/session/mysession.vim<CR>", opts)
bind('n', "<leader>sl", ":source ~/.config/nvim/session/mysession.vim<CR>", opts)

