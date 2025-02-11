return {
  -- LSP Support
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'b0o/schemastore.nvim',

  -- DAP support
  -- 'mfussenegger/nvim-dap',
  -- 'nvim-neotest/nvim-nio',
  -- 'jay-babu/mason-nvim-dap.nvim',
  -- 'theHamsta/nvim-dap-virtual-text',
  -- 'rcarriga/nvim-dap-ui',

  -- Snippets
  'SirVer/ultisnips',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',

  -- Completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',
  -- 'jayli/vim-easycomplete',

  -- Null LS
  'jay-babu/mason-null-ls.nvim',
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
  },

  -- misc
  {
    'someone-stole-my-name/yaml-companion.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('yaml_schema')
    end,
  },
}
