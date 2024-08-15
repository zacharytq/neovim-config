return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- evenbuild = ":TSUpdate",
    config = function() 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "html",
            "python",
            "yaml",
            "ruby",
          },
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
      end,
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
  }
}
