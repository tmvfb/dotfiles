-- https://github.com/lewis6991/pckr.nvim
-- https://github.com/nvim-lua/kickstart.nvim
-- https://github.com/ecosse3/nvim/blob/master/lua/config/plugins.lua

local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {

    -- https://github.com/gelguy/wilder.nvim
    -- https://github.com/sindrets/diffview.nvim

    'tpope/vim-sensible';  -- basic config for nvim

    'nvim-lua/plenary.nvim';  -- basic config for nvim
    'nvim-tree/nvim-web-devicons';
    'svban/YankAssassin.vim';  -- leaves cursor after yank

    {
      'williamboman/mason.nvim',  -- lsp config
      config = function()
        require("mason").setup()
      end
    };

    {
      'goolord/alpha-nvim',  -- greet screen
      config = function()
        require 'alpha'.setup(require 'alpha.themes.startify'.config)
      end
    };

    {
      "willothy/nvim-cokeline",  -- bufferline
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "stevearc/resession.nvim"
      },
      config = function()
        require('cokeline').setup()
      end
    };

    -- 'AndrewRadev/splitjoin.vim';
    'tpope/vim-fugitive';  -- working with git

    {
      'neogitorg/neogit',  -- woking with git
      config = function()
        local neogit = require('neogit')
        neogit.setup()
      end,
      requires = 'nvim-lua/plenary.nvim'
    };

    {
      'ten3roberts/qf.nvim',  -- quickfix
      config = function()
        require 'qf'.setup {}
      end
    };

    'tpope/vim-repeat';  -- repeat whole pattern instead of only last command

    {
      'kosayoda/nvim-lightbulb',  -- show lightbulb if actions available (F4, covered by lsp-zero)
      config = function()
        local lightbulb = require('nvim-lightbulb')
        lightbulb.setup({ autocmd = { enabled = true } })
      end
    };

    {
      'nvim-tree/nvim-tree.lua',  -- tree on the left (g? for help)
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    };

    {
      'stevearc/dressing.nvim',  -- improve ui
      config = function()
        -- TODO: add c-[ for normal mode
        -- https://github.com/stevearc/dressing.nvim/issues/29
        local dressing = require('dressing')
        dressing.setup({
          input = {
            get_config = function()
              if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
                return { enabled = false }
              end
            end,
          },
        })
      end
    };

    {
      'freddiehaddad/feline.nvim',  -- statusline
      after = "nvim-web-devicons",
      config = function()
        require('feline').setup({
          -- preset = 'noicon'
        })
      end
    };

    {
      'nvim-zh/auto-save.nvim',  -- some weird fork
      config = function()
        local autosave = require("auto-save")
        autosave.setup()
      end
    };

    'ntpeters/vim-better-whitespace';  -- trailing
    'tpope/vim-sleuth';  -- tab width
    {
      'lukas-reineke/indent-blankline.nvim',  -- indentation vertical lines
        config = function()
          require("ibl").setup()
        end
    };

    -- alternative https://github.com/machakann/vim-sandwich
    -- https://github.com/kylechui/nvim-surround
    'tpope/vim-surround';  -- powerful plugin to add brackets
    {
      'nvim-pack/nvim-spectre',  -- powerful plugin for search
      requires = {
        "nvim-lua/plenary.nvim",
      }
    };
    'dyng/ctrlsf.vim';  -- editing files in place during search
    'marko-cerovac/material.nvim';  -- colorscheme
    'tpope/vim-unimpaired';  -- a few new mappings

    {
      'numToStr/Comment.nvim',  -- adds new bindings for commenting (gcc, gcO etc.)
      config = function()
        require('Comment').setup({
        })
      end
    };

    {
      "folke/trouble.nvim",  -- diagnostics tool
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    };

    {
      'lewis6991/gitsigns.nvim',  -- git integration for buffer
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end
    };

    {
      "folke/which-key.nvim",  -- popups with key suggestions
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    };

    unpack(require('plugins.treesitter'));
    unpack(require('plugins.lsp'));
    unpack(require('plugins.specific'));

    {
      'nvim-telescope/telescope.nvim',
      config = function()
        -- require('telescope').load_extension('fzf')
        -- require('refactoring').setup()
        -- require('telescope').load_extension('refactoring')

        -- local trouble = require("trouble.providers.telescope")

        require('telescope').setup {
          defaults = {
            sorting_strategy = "ascending",
            mappings = {
              -- restore default behavior
              i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                -- ["<c-t>"] = trouble.open_with_trouble
              },
              n = {
                -- ["<c-t>"] = trouble.open_with_trouble
              }
            },
          },
          pickers = {
            buffers = {
              ignore_current_buffer = true,
              sort_mru = true
            }
          },
        }
      end,
      requires = { 'nvim-lua/plenary.nvim' }
    };

}
