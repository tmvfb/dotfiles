return {

  -- LSP Support
  'neovim/nvim-lspconfig',
  'b0o/schemastore.nvim',
  { 'mason-org/mason.nvim', config = function() require("mason").setup() end },
  {
    'mason-org/mason-lspconfig.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Mason-LSPconfig -----------------------------
      require('mason-lspconfig').setup({
        ensure_installed = {
          'gopls',
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
          'pylsp',
        },
      })
    end
  },

  -- Null LS
  {
    'nvimtools/none-ls.nvim',
    event = { "BufReadPre", "BufNewFile" },
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
