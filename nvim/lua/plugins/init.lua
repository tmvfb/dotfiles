-- https://github.com/wbthomason/packer.nvim
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

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add {

    -- https://github.com/gelguy/wilder.nvim
    -- https://github.com/sindrets/diffview.nvim
    -- https://github.com/kylechui/nvim-surround
    -- 'wbthomason/packer.nvim';
    -- speeding up
    'lewis6991/impatient.nvim';
    -- 'nathom/filetype.nvim';

    'tpope/vim-sensible';

    'nvim-lua/plenary.nvim';
    'nvim-tree/nvim-web-devicons';
    'svban/YankAssassin.vim';

    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end
    };

    -- TODO: add
    -- https://github.com/gbprod/yanky.nvim

    -- {
    --   'rcarriga/nvim-notify',
    --   config = function()
    --     require("notify").setup({})
    --   end
    -- };

    -- {
    --   'ggandor/leap.nvim',
    --   config = function()
    --     local leap = require('leap')
    --     leap.add_default_mappings()
    --   end
    -- };

    -- {
    --   'phaazon/hop.nvim',
    --   config = function()
    --     require 'hop'.setup()
    --   end
    -- };

    {
      'goolord/alpha-nvim',
      config = function()
        require 'alpha'.setup(require 'alpha.themes.startify'.config)
      end
    };

    {
      "willothy/nvim-cokeline",
      requires = {
        "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- If you want devicons
        "stevearc/resession.nvim"       -- Optional, for persistent history
      },
      config = function()
        require('cokeline').setup()
      end
    };


    'tpope/vim-fugitive';
    'LudoPinelli/comment-box.nvim';
    'AndrewRadev/splitjoin.vim';

    {
      'ten3roberts/qf.nvim',
      config = function()
        require 'qf'.setup {}
      end
    };

    {
      'neogitorg/neogit',
      config = function()
        local neogit = require('neogit')
        neogit.setup()
      end,
      requires = 'nvim-lua/plenary.nvim'
    };


    'antoinemadec/FixCursorHold.nvim';

    'tpope/vim-repeat';

    {
      'kosayoda/nvim-lightbulb',
      requires = 'antoinemadec/FixCursorHold.nvim',
      config = function()
        local lightbulb = require('nvim-lightbulb')
        lightbulb.setup({ autocmd = { enabled = true } })
      end
    };

    {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    };

    {
      'stevearc/dressing.nvim',
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
            -- mappings = {
            --   n = {
            --     ['C-['] = 'Close',
            --   },
            -- },
          },
          --   select = {
          --     telescope = {
          --       mappings = {
          --         n = {
          --           ['C-['] = 'Close',
          --         },
          --       },
          --     },
          --   },
        })
      end
    };

    {
      'feline-nvim/feline.nvim',
      after = "nvim-web-devicons",
      config = function()
        require('feline').setup({
          -- preset = 'noicon'
        })
      end
    };

    {
      'nvim-zh/auto-save.nvim',
      config = function()
        local autosave = require("auto-save")
        autosave.setup()
      end
    };

    'ntpeters/vim-better-whitespace';
    'tpope/vim-sleuth';
    'lukas-reineke/indent-blankline.nvim';

    -- alternative https://github.com/machakann/vim-sandwich
    'tpope/vim-surround';
    'windwp/nvim-spectre';
    'dyng/ctrlsf.vim';
    'marko-cerovac/material.nvim';
    --
    'tpope/vim-unimpaired';

    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
        })
      end
    };

    {
      "folke/trouble.nvim",
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
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end
    };

    {
      "folke/which-key.nvim",
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
