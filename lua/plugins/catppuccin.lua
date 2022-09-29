local present, catppuccin = pcall(require, "catppuccin")

if not present then
  return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup()

vim.cmd [[colorscheme catppuccin]]
