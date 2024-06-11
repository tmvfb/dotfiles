require('pckr').add {
  {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',

      -- DAP support
      { 'mfussenegger/nvim-dap', opt = true },
      { 'nvim-neotest/nvim-nio', opt = true },
      { 'jay-babu/mason-nvim-dap.nvim', opt = true },
      { 'theHamsta/nvim-dap-virtual-text', opt = true },
      { 'rcarriga/nvim-dap-ui', opt = true },

      -- Snippets
      { 'SirVer/ultisnips', opt = true },
      { 'L3MON4D3/LuaSnip', opt = true },
      { 'rafamadriz/friendly-snippets', opt = true },

      -- Completion
      { 'hrsh7th/nvim-cmp', event = "InsertEnter" },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'onsails/lspkind.nvim', after = 'nvim-cmp' },
      { 'jayli/vim-easycomplete', opt = true },

      -- Null LS
      { 'jay-babu/mason-null-ls.nvim', opt = true },
      {
        "nvimtools/none-ls.nvim",
        requires = {
          "nvimtools/none-ls-extras.nvim",
        },
        opt = true,
      },
    },

    config = function()
      -- vim.lsp.set_log_level('debug')

      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp.default_keymaps({ buffer = bufnr })
      end)

      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          'marksman',
          'ltex',
          'tsserver',
          'ansiblels',
          'bashls',
          'dockerls',
          'grammarly',
          'sqlls',
          'lua_ls',
          'pyright',
          'ruff_lsp',
          'stylelint_lsp',
          'terraformls',
          'vimls',
          'yamlls',
          'html',
          'cssls',
          'eslint',
          'jsonls',
          'tailwindcss',
          'lemminx',
        },
        handlers = {
          lsp.default_setup,
        },
      })

      lsp.setup()

      local null_ls = require('null-ls')
      local null_opts = lsp.build_options('null-ls', {})

      null_ls.setup({
        debug = true,
        on_attach = null_opts.on_attach,
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.diagnostics.djlint,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.zsh,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.djlint,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.hover.printenv,
        }
      })

      local cmp = require('cmp')
      local cmp_config = lsp.defaults.cmp_config({
        preselect = 'none',
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect'
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
          }),
          ['<tab>'] = cmp.mapping.select_next_item(),
          -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        },
      })

      cmp.setup(cmp_config)
    end
  },

  {
    'j-hui/fidget.nvim',
    kconfig = function()
      require "fidget".setup()
    end,
  },

  {
    "folke/trouble.nvim", -- diagnostics tool
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  },

}
