local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup({
  cmdline = {
    view = 'cmdline',
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      cmdline = { pattern = "^:", icon = "    ", icon_hl_group = "DiagnosticWarn" },
      search_down = { kind = "search", pattern = "^/", icon = "    ", ft = "regex", icon_hl_group = "DiagnosticWarn" },
      search_up = { kind = "search", pattern = "^%?", icon = "    ", ft = "regex" },
      filter = { pattern = "^:%s*!", icon = "   $ ", ft = "sh", icon_hl_group = "DiagnosticWarn" },
      lua = { pattern = "^:%s*lua%s+", icon = "    ", ft = "lua" },
      -- lua = false, -- to disable a format, set to `false`
    },
  }
})
