local present, mason = pcall(require, "mason-lspconfig")

if not present then
  return
end

mason.setup({
  ensure_installed = { "rust_analyzer" }
})
