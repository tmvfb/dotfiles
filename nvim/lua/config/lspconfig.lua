-- Completion ------------------------------------------
local cmp = require('cmp')
local cmp_config = {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp_signature_help' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      -- select = true
    }),
    ['<tab>'] = cmp.mapping.select_next_item(),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  },
  formatting = {
    format = require('lspkind').cmp_format() -- shows icons on completion
  }
}
cmp.setup(cmp_config)

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Mason + Mason-LSPconfig -----------------------------
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
  capabilities = capabilities
})

require('mason').setup() -- installs servers and runs setup for them
require('mason-lspconfig').setup({
  PATH = "prepend",
  automatic_installation = true,
  ensure_installed = {
    'marksman',
    'ltex',
    'ansiblels',
    'bashls',
    'dockerls',
    'grammarly',
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
    ["pylsp"] = function()  -- disable extra diagnostics
      require("lspconfig").pylsp.setup({
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end
        },
        capabilities = capabilities
      })
    end,
    ["yamlls"] = function()  -- add kubernetes schemas
      require('lspconfig').yamlls.setup(yaml_cfg)
    end,
    ["jsonls"] = function()
      require('lspconfig').jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
        capabilities = capabilities
      }
    end,
  }
})

-- None-ls ---------------------------------------------
local null_ls = require('null-ls')
null_ls.setup({
  debug = true,
  on_attach = lsp_attach,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.djlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.format_r,
    null_ls.builtins.hover.printenv,
  }
})
