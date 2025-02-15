local options = {
  -- Language & Input
  -- spelllang  = 'en_us,ru',
  langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',

  -- UI & Navigation
  number = true,                          -- Show line numbers
  relativenumber = true,                  -- Relative line numbers
  scrolloff = 1,                           -- Keep cursor 1 lines away from screen edge
  sidescrolloff = 2,                       -- Keep 2 columns to the side when scrolling
  sidescroll = 1,                          -- Smooth horizontal scrolling
  signcolumn = "yes:1",                    -- Always show sign column
  -- laststatus = 3,                          -- Global statusline instead of per-window
  wildmenu = true,                         -- Enable command-line completion menu
  wildoptions = "pum",                     -- Use popup menu for wildmenu
  -- cmdheight      = 1,                    -- More space for displaying messages
  -- showtabline    = 2,                    -- Always show tab bar

  -- Search & Case Sensitivity
  -- incsearch = true,                        -- Show search matches as you type
  ignorecase = true,                        -- Ignore case in search
  smartcase = true,                        -- Override ignorecase if search contains uppercase
  -- timeoutlen     = 200,                   -- Faster completion (cannot be lower than 200)

  -- Clipboard & Undo
  clipboard = "unnamed,unnamedplus",       -- Copy-paste with system clipboard
  undofile = true,                         -- Persistent undo
  -- swapfile       = false,                 -- Disable swap file
  -- backup         = false,                 -- Disable backup file
  -- writebackup    = false,                 -- Disable writing backup

  -- Indentation & Formatting
  -- expandtab      = true,                  -- Use spaces instead of tabs
  -- shiftwidth     = 2,                      -- Number of spaces per indentation
  -- smartindent    = true,                   -- Smart indentation
  -- smarttab       = true,                   -- Smart tabbing
  -- softtabstop    = 2,                      -- Insert 2 spaces for a tab
  -- tabstop        = 2,                      -- Tab width
  -- conceallevel   = 0,                      -- Show `` in markdown files

  -- Listchars & Display
  listchars = {
    tab = "> ", trail = "-", extends = ">", precedes = "<", nbsp = "+"
  },
  display = { "lastline" },                -- Show last line even when wrapped

  -- Colors & Terminal
  termguicolors = true,                    -- Better terminal colors
  -- emoji          = false,                  -- Fix emoji display

  -- File handling
  autoread = true,                         -- Reload files if changed externally
  fileformats = { "dos", "unix" },
  fixeol = false,                          -- Don't add end-of-line automatically
  eol = false,                             -- Don't enforce end-of-line
  -- viminfo = "'1000",                       -- Increase the size of file history
  -- wildignore     = "*node_modules/**",     -- Ignore Node.js modules in search
  -- wrap           = true,                   -- Display long lines as one line

  -- Performance
  -- lazyredraw     = true,                   -- Makes macros faster & prevent errors in mappings
  -- updatetime     = 100,                     -- Faster completion
  -- pumheight      = 10,                      -- Max num of items in completion menu

  -- Neovim defaults
  -- autoindent     = true,                   -- Good auto indent
  backspace = { "indent", "eol", "start" }, -- Making sure backspace works
  -- encoding       = "utf-8",                 -- Encoding displayed
  -- fileencoding   = "utf-8",                 -- Encoding written to file
  -- errorbells     = false,                   -- Disable error sound
  -- showmode       = false,                   -- Don't show -- INSERT -- mode anymore
}

local globals = {
  mapleader = ' ', --- Map leader key to SPC
  loaded = 1,
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
  -- speeddating_no_mappings     = 1,          --- Disable default mappings for speeddating
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
