local present, nf = pcall(require, "nightfly")

if not present then
  return
end

vim.cmd [[colorscheme nightfly]]
