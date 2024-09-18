local lsp = require('lsp-zero')
local lsp_attach = function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  -- this is where you enable features that only work
  -- if there is a language server active in the file
end

lsp.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
})

require('mason').setup()
require('mason-lspconfig').setup({
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
    'ruff',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  debug = true,
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.djlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.yamllint,
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
