local present, ls = pcall(require, "luasnip")

if not present then
  return
end

local lua_loader = require("luasnip.loaders.from_lua")

local options = {
  store_selection_keys = "<Tab>",
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

ls.config.set_config(options)

lua_loader.lazy_load({ paths = "~/.config/nvim/lua/snippets/"})
