return {
  'tpope/vim-fugitive',        -- working with git
  'sindrets/diffview.nvim',    -- VScode-like diffview
  {
    'lewis6991/gitsigns.nvim', -- git integration for buffer
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require('gitsigns').setup() end
  },
}
