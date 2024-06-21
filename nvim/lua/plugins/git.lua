return {
  { 'tpope/vim-fugitive', cmd = { "G", "Git", "Gdiff" } }, -- working with git
  { 'sindrets/diffview.nvim', cmd = { "DiffviewFileHistory", "DiffviewOpen" } }, -- VScode-like diffview
  {
    'lewis6991/gitsigns.nvim',                    -- git integration for buffer
    event = "VeryLazy",
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  },
}
