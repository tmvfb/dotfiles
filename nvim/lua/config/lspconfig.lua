-- capabilities + on_attach (global defaults)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local function lsp_attach(client, bufnr)
  -- buffer-local LSP keymaps, etc.
end

-- 1) Set GLOBAL defaults for all LSPs
vim.lsp.config('*', {
  on_attach = lsp_attach,
  capabilities = capabilities,
})

-- 2) Per-server overrides

-- pylsp: disable diagnostics
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          -- completely disable the plugin:
          -- enabled = false,
          -- ignore specific errors:
          -- ignore = { 'E501' },
          -- tweak maxLineLength:
          maxLineLength = 120,
        },
      },
    },
  },
})

-- jsonls: use SchemaStore
vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
