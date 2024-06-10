require('pckr').add {
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },

  'slim-template/vim-slim',

  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  },

  'dhruvasagar/vim-table-mode',
  'mfussenegger/nvim-jdtls',
}
