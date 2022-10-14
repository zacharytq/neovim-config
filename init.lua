-- autocmds
local autocmd = vim.api.nvim_create_autocmd

require "core.options"
require "core.mapps"

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons"
  }

  use {
    'nvim-lua/plenary.nvim',
    module = 'plenary'
  }

  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('plugins.configs.catppuccin')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    setup = function()
      require('core.lazy_load').on_file_open 'nvim-treesitter'
    end,
    cmd = require('core.lazy_load').treesitter_cmds,
    run = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter')
    end,
  }

  use {
    "nvim-lualine/lualine.nvim",
    config = function ()
      require "plugins.configs.lualine"
    end,
  }

  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    setup = function()
      require "plugins.setups.telescope"
    end,
    config = function()
      require "plugins.configs.telescope"
    end,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    module = 'telescope._extensions.fzf'
  }
  -- Setup mason before lspconfig.
  -- Plugin docs says not to lazy load
  use {
    "williamboman/mason.nvim",
    config = function()
      require "plugins.configs.mason"
    end,
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "plugins.configs.mason-lspconfig"
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    opt = true,
    module = "lspconfig",
    setup = function()
      require('core.lazy_load').on_file_open "nvim-lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end,
  }

  use {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = function()
      require "plugins.configs.rust-tools"
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require "plugins.configs.toggleterm"
    end,
    cmd = "ToggleTerm",
    setup = function()
      require "plugins.setups.toggleterm"
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    ft = 'gitcommit',
    setup = function()
      require("core.lazy_load").gitsigns()
    end,
    config = function()
      require("plugins.configs.gitsigns")
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    module = { "cmp", "cmp_nvim_lsp" },
    event = "InsertEnter",
    config = function()
      require "plugins.configs.cmp"
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.luasnip"
    end,
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip"
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua"
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp"
  }

  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require "plugins.configs.autopairs"
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
