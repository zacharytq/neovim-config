local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local time = function()
  return os.date("%H:%M")
end

local M = {
  s(
    { -- Table 1: snippet parameters
      trig="entry",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("- "),-- A single text node
      f(time),
      t(" | Entry -> "),
      i(0),
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
}

return M
