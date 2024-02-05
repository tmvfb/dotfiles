return {
  servers = {
    };

    {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'b0o/schemastore.nvim',

        -- DAP support
        'mfussenegger/nvim-dap';
        'jay-babu/mason-nvim-dap.nvim',
        'theHamsta/nvim-dap-virtual-text',
        'rcarriga/nvim-dap-ui',

        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',

        -- Null LS
        'jay-babu/mason-null-ls.nvim',
        'jose-elias-alvarez/null-ls.nvim',
      },

      config = function()
        -- vim.lsp.set_log_level('debug')

        local lsp = require('lsp-zero')
        lsp.preset('recommended')

        lsp.on_attach(function(client, bufnr)
          lsp.default_keymaps({ buffer = bufnr })
          local opts = { buffer = bufnr, remap = false }
          local bind = vim.keymap.set

          bind('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
          -- bind('n', "gr", "<cmd>TroubleToggle quickfix<cr>", opts)
          bind('n', '<space>rn', vim.lsp.buf.rename, opts)
          bind('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end)

        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
            'marksman',
            'ltex',
            'tsserver',
            -- 'phpactor',
            'ansiblels',
            'bashls',
            'dockerls',
            'elixirls',
            -- 'gopls',
            'grammarly',
            'jdtls',
            'omnisharp',
            -- 'psalm',
            -- 'pyright',
            -- 'sorbet',
            'sqlls',
            'lua_ls',
            'stylelint_lsp',
            'terraformls',
            -- 'rubocop',
            'vimls',
            'yamlls',
            'html',
            -- 'haml-lint',
            'cssls',
            'eslint',
            'jsonls',
            -- 'ruby_ls',
            -- 'solargraph',
            'tailwindcss'
        },
          handlers = {
            lsp_zero.default_setup,
          },
        })

        local solargraph_opts = {
          cmd = { 'bin/solargraph' }
        }

        local sorbet_opts = {
          cmd = { 'bin/sorbet' }
        }

        lsp.configure('sorbet', sorbet_opts)
        lsp.configure('solargraph', solargraph_opts)

        lsp.setup()

        local slim_diagnostics = require('plugins.null-ls.slim-lint')

        local null_ls = require('null-ls')
        local null_opts = lsp.build_options('null-ls', {})

        null_ls.setup({
          debug = true,
          on_attach = null_opts.on_attach,
          sources = {
            slim_diagnostics,
            -- null_ls.builtins.diagnostics.rubocop,
            null_ls.builtins.diagnostics.haml_lint,
            null_ls.builtins.code_actions.gitsigns,
            null_ls.builtins.code_actions.refactoring,
            -- null_ls.builtins.code_actions.shellcheck,
            -- null_ls.builtins.diagnostics.actionlint,
            -- null_ls.builtins.diagnostics.checkmake,
            null_ls.builtins.diagnostics.codespell,
            -- null_ls.builtins.diagnostics.curlylint,
            null_ls.builtins.diagnostics.djlint,
            -- null_ls.builtins.diagnostics.dotenv_linter,
            -- null_ls.builtins.diagnostics.editorconfig_checker,
            null_ls.builtins.diagnostics.erb_lint,
            null_ls.builtins.formatting.erb_lint,
            null_ls.builtins.diagnostics.flake8,
            -- null_ls.builtins.diagnostics.hadolint,
            null_ls.builtins.diagnostics.jsonlint,
            -- null_ls.builtins.diagnostics.luacheck,
            -- null_ls.builtins.diagnostics.markdownlint,
            -- null_ls.builtins.diagnostics.selene,
            null_ls.builtins.diagnostics.stylelint,
            null_ls.builtins.formatting.stylelint,
            -- null_ls.builtins.diagnostics.tidy,
            null_ls.builtins.diagnostics.yamllint,
            null_ls.builtins.diagnostics.zsh,
            null_ls.builtins.formatting.autopep8,
            null_ls.builtins.formatting.beautysh,
            null_ls.builtins.formatting.codespell,
            null_ls.builtins.formatting.djlint,
            null_ls.builtins.formatting.isort,
            -- null_ls.builtins.formatting.jq,
            -- null_ls.builtins.formatting.lua_format,
            -- null_ls.builtins.formatting.prettier,
            -- null_ls.builtins.formatting.nginx_beautifier,
            -- null_ls.builtins.formatting.pg_format,
            null_ls.builtins.formatting.phpcbf,
            -- null_ls.builtins.formatting.phpcsfixer,
            -- null_ls.builtins.formatting.terrafmt,
            null_ls.builtins.formatting.terraform_fmt,
            null_ls.builtins.formatting.trim_whitespace,
            null_ls.builtins.formatting.trim_newlines,
            null_ls.builtins.formatting.xmllint,
            null_ls.builtins.hover.printenv,
            -- null_ls.builtins.formatting.eslint,
          }
        })

        local cmp = require('cmp')

        local cmp_config = lsp.defaults.cmp_config({
          preselect = 'none',
          completion = {
            completeopt = 'menu,menuone,noinsert,noselect'
          },
          sources = sources,
          mapping = {
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          },
        })

        cmp.setup(cmp_config)
      end
    };

    {
      'j-hui/fidget.nvim',
      kconfig = function()
        require "fidget".setup {}
      end,
    };
}
