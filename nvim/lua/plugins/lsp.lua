return {

  -- LSP Support
  'neovim/nvim-lspconfig',
  'b0o/schemastore.nvim',
  { 'williamboman/mason.nvim', config = function() require("mason").setup() end },
  {
    'williamboman/mason-lspconfig.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- this is where you enable features that only work
        -- if there is a language server active in the file
      end

      -- Mason-LSPconfig -----------------------------
      require('mason-lspconfig').setup({
        PATH = "prepend",
        automatic_installation = true,
        ensure_installed = {
          'marksman',
          'ltex',
          'ansiblels',
          'bashls',
          'dockerls',
          'sqlls',
          'lua_ls',
          'pyright',
          'stylelint_lsp',
          'terraformls',
          'vimls',
          'yamlls',
          'html',
          'cssls',
          'jsonls',
          'tailwindcss',
          'lemminx',
          'pylsp'
        },

        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              on_attach = lsp_attach,
              capabilities = capabilities
            })
          end,

          -- custom behaviour
          ["pylsp"] = function() -- disable extra diagnostics
            require("lspconfig").pylsp.setup({
              handlers = {
                ['textDocument/publishDiagnostics'] = function() end
              },
              on_attach = lsp_attach,
              capabilities = capabilities
            })
          end,
          ["jsonls"] = function()
            require('lspconfig').jsonls.setup {
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
              on_attach = lsp_attach,
              capabilities = capabilities
            }
          end,
        }
      })
    end
  },

  -- misc
  {
    'someone-stole-my-name/yaml-companion.nvim',
    ft = "yaml",
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('yaml_schema')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(client, bufnr)
        -- this is where you enable features that only work
        -- if there is a language server active in the file
      end
      local yaml_cfg = require("yaml-companion").setup({
        -- Add any options here, or leave empty to use the default settings
        -- lspconfig = {
        --   cmd = {"yaml-language-server"}
        -- },
        capabilities = capabilities,
        on_attach = lsp_attach
      })
      require('lspconfig').yamlls.setup(yaml_cfg)
    end,
  },

  -- Null LS
  {
    'nvimtools/none-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    config = function()
      local lsp_attach = function(client, bufnr)
        -- this is where you enable features that only work
        -- if there is a language server active in the file
      end
      local null_ls = require('null-ls')
      null_ls.setup({
        debug = true,
        on_attach = lsp_attach,
        sources = { -- these need to be available through path
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.diagnostics.actionlint,
          null_ls.builtins.diagnostics.checkmake,
          null_ls.builtins.diagnostics.djlint,
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.zsh,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.yamlfix,
          null_ls.builtins.formatting.djlint,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.formatting.format_r,
          null_ls.builtins.hover.printenv,
        }
      })
    end,
  },

  -- DAP support
  -- 'mfussenegger/nvim-dap',
  -- 'nvim-neotest/nvim-nio',
  -- 'jay-babu/mason-nvim-dap.nvim',
  -- 'theHamsta/nvim-dap-virtual-text',
  -- 'rcarriga/nvim-dap-ui',

}
