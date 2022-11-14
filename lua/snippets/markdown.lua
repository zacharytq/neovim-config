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

local date = function()
  return os.date("%x")
end

local date_time = function()
  return os.date("%x %H:%M")
end

local buf_name = function()
  return vim.fn.expand("%:t:r")
end

local function long_date()
  return os.date("%B %d, %Y")
end

local function uuid()
    math.randomseed(os.time())
    local random = math.random
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

local M = {
  s(
    { -- Table 1: snippet parameters
      trig="tentry",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("- "),-- A single text node
      f(time),
      t(" |-> "),
      i(0),
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),

  s(
    { -- Table 1: snippet parameters
      trig="dtentry",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("- "),-- A single text node
      f(date_time),
      t(" |-> "),
      i(0),
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
  s(
    {
      trig = "frontmatter",
      dscr = "A snippet that expands to yaml frontmatter for markdown",
    },
    fmt(
      [[
        ---
        title: {}
        date_created: {}
        categories: [ {} ]
        note_id: {}
        ---
        
        {}
      ]],
      { f(buf_name), f(date), i(1), f(uuid), i(0)}
    )
  ),

  s(
    {
      trig = "dai",
      dscr = "A snippet that expands to daily logs note template"
    },
    fmt(
      [[
        # {}

        ## Tasks

        ## Logs

        {}
      ]],
      { f(long_date), i(0) }
    )
  ),

  s(
    {
      trig = "dt",
      dscr = "A snipped that expands to daily tasks"
    },
    fmt(
      [[
        - [] Daily -> Clean Mochi's litterbox
        - [] Daily -> Feed Mochi
        - [] Daily -> Brush teeth, morning
        - [] Daily -> Brush teeth, night
        - [] Daily -> Floss teeth
        {}
      ]],
      {i(0)}
    )
  )
}

return M
