require('pckr').add {
  {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'astral-sh/ruff-lsp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',

      -- DAP support
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'jay-babu/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'folke/neodev.nvim',

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
      'jayli/vim-easycomplete', -- required at least for yaml

      -- Null LS
      'jay-babu/mason-null-ls.nvim',
      {
        "nvimtools/none-ls.nvim",
        requires = {
          "nvimtools/none-ls-extras.nvim",
        },
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

      require('mason').setup({})
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          'marksman',
          'ltex',
          'tsserver',
          'ansiblels',
          'bashls',
          'dockerls',
          'elixirls',
          'grammarly',
          'jdtls',
          'omnisharp',
          'pyright',
          'sqlls',
          'lua_ls',
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

      local slim_diagnostics = require('plugins.none-ls.slim-lint')

      local null_ls = require('null-ls')
      local null_opts = lsp.build_options('null-ls', {})

      null_ls.setup({
        debug = true,
        on_attach = null_opts.on_attach,
        sources = {
          require("none-ls.diagnostics.flake8"),
          slim_diagnostics,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,
          -- null_ls.builtins.code_actions.shellcheck,
          -- null_ls.builtins.diagnostics.actionlint,
          -- null_ls.builtins.diagnostics.checkmake,
          null_ls.builtins.diagnostics.codespell,
          -- null_ls.builtins.diagnostics.curlylint,
          null_ls.builtins.diagnostics.djlint,
          -- null_ls.builtins.diagnostics.dotenv_linter,
          null_ls.builtins.diagnostics.editorconfig_checker,
          -- null_ls.builtins.diagnostics.hadolint,
          -- null_ls.builtins.diagnostics.luacheck,
          -- null_ls.builtins.diagnostics.markdownlint,
          -- null_ls.builtins.diagnostics.selene,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.formatting.stylelint,
          -- null_ls.builtins.diagnostics.tidy,
          null_ls.builtins.diagnostics.yamllint,
          null_ls.builtins.diagnostics.zsh,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.codespell,
          null_ls.builtins.formatting.djlint,
          null_ls.builtins.formatting.isort,
          -- null_ls.builtins.formatting.lua_format,
          null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.nginx_beautifier,
          -- null_ls.builtins.formatting.pg_format,
          -- null_ls.builtins.formatting.terrafmt,
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
      require "fidget".setup {}
    end,
  },
}
