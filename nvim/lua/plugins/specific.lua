require('pckr').add {
  'dhruvasagar/vim-table-mode',
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
