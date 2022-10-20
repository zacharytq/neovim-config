local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup({
  cmdline = {
    view = 'cmdline',
    icons = {
      [":"] = { icon = "    ", hl_group = "DiagnosticInfo", firstc = false },
      ["/"] = { icon = "    ", hl_group = "DiagnosticWarn", firstc = false },
    }
  }
})
