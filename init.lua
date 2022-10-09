-- autocmds
local autocmd = vim.api.nvim_create_autocmd

require "core.options"

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
