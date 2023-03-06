local present, mf = pcall(require, "moonfly")

if not present then
  return
end

vim.cmd [[colorscheme moonfly]]
