require('pckr').add {
  'slim-template/vim-slim',
  'dhruvasagar/vim-table-mode',
  'mfussenegger/nvim-jdtls',

  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  },
}
