local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local fn_map = vim.keymap.set

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Nvim Tree --
keymap("n", "<leader>et", "<cmd> NvimTreeToggle <CR>", opts)
keymap("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", opts)

-- LSP Shits
--
fn_map("n", "K", function() vim.lsp.buf.hover() end, opts)
fn_map("n", "gd", function() vim.lsp.buf.definition() end, opts)
fn_map("n", "gD", function() vim.lsp.buf.declaration() end, opts)
fn_map("n", "gi", function() vim.lsp.buf.implementation() end, opts)
fn_map("n", "gr", function() vim.lsp.buf.references() end, opts)
fn_map("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
fn_map("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
fn_map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
fn_map("n", "<leader>f", function() vim.diagnostic.open_float() end, opts)
fn_map("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
