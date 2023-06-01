local opts = { silent = true, noremap = true }
local bind = vim.keymap.set

bind("n", "<leader>h", ":nohlsearch<CR>", opts)

bind('n', '<leader>vr', ':so $MYVIMRC<CR>')

-- Better window movement
bind("n", "<C-l>", "<C-w>l", opts)
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)

bind("n", "gV", "`[v`]", opts)

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

bind('v', '"y', '"+y', opts)
bind('n', '"y', '"+y', opts)
bind('n', '"Y', '"+Y', opts)
bind('n', '"p', '"+p', opts)
bind('n', '"P', '"+P', opts)

-- Save file by CTRL-S
-- keymap("n", "<C-s>", ":w<CR>", silent)
-- keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Buffers
bind("n", "gn", ":bn<CR>", opts)
bind("n", "gp", ":bp<CR>", opts)

-- Don't yank on delete char
-- bind("n", "x", '"_x', opts)
-- bind("n", "X", '"_X', opts)
-- bind("v", "x", '"_x', opts)
-- bind("v", "X", '"_X', opts)

-- Don't yank on visual paste
bind("v", "p", '"_dP', opts)

-- Quickfix
-- keymap("n", "<leader>,", ":cp<CR>", silent)
-- keymap("n", "<leader>.", ":cn<CR>", silent)

-- Toggle quicklist
-- https://github.com/ecosse3/nvim/blob/master/lua/utils/init.lua
-- bind("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>")

-- Easyalign
-- keymap("n", "ga", "<Plug>(EasyAlign)", silent)
-- keymap("x", "ga", "<Plug>(EasyAlign)", silent)

-- Refactor with spectre
bind("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
bind("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- Comment Box
bind("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", opts)
bind("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", opts)

-- LSP
-- partially implemented in zero-lsp

bind("v",  "<leader>rr",  "<Esc><rmd>lua require('telescope').extensions.refactoring.refactors()<CR>", opts)

-- bind('n', '<leader>e', vim.diagnostic.open_float, opts)
bind('n', '<leader>q', "<cmd>lua require('qf').toggle('l', true)<cr>", opts)
bind('n', "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
bind("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
bind("n", "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
bind("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
bind("n", "<leader>sd", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)
bind("n", "<leader>sc", "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
bind("n", "<leader>sr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
bind("n", "<leader>so", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
bind("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
--
bind('n', '<leader><leader>', ':NvimTreeToggle<CR>')

bind('n', '<C-n>', ':NvimTreeFindFile<CR>')

bind('n', '<leader>;', '<cmd>TroubleToggle<CR>', opts)

bind('n', '<leader>p', ':set paste<CR>', opts)
bind('n', '<leader>pp', ':set nopaste<CR>', opts)

-- Django templates syntax (see functions.lua)
bind('n', '<leader>tt', "<cmd>lua require('functions').Surround_translation()<CR>", opts)
bind('n', '<leader>tu', "<cmd>lua require('functions').Surround_url()<CR>", opts)
bind('n', '<leader>t{', "<cmd>lua require('functions').Surround_brackets()<CR>", opts)
bind('n', '<leader>tf', "<cmd>lua require('functions').Surround_func()<CR>", opts)

-- Select current word and run command to replace it
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
