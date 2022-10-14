local present, catppuccin = pcall(require, "catppuccin")

if not present then
  return
end

vim.g.catppuccin_flavour = "mocha"

local options = {
  integrations = {
    gitsigns = true,
    telescope = true,
    treesitter = true,
  }
}
catppuccin.setup(options)

vim.cmd [[colorscheme catppuccin]]
