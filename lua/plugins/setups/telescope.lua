-- Telescope keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Space>ff", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<Space>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", opts)
keymap("n", "<Space>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<Space>tk", "<cmd> Telescope keymaps <CR>", opts)
