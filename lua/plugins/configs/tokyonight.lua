local present, tn = pcall(require, "tokyonight")

if not present then
  return
end

tn.setup({
  style = "storm"
})

vim.cmd [[colorscheme tokyonight]]
