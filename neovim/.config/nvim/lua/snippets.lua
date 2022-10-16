-- Local shortcuts as suggested in https://github.com/L3MON4D3/Luas/blob/master/DOC.md#loaders
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local extras = require("luasnip.extras")
-- local m = extras.m
-- local l = extras.l
-- local rep = extras.rep
-- local postfix = require("luasnip.extras.postfix").postfix

ls.add_snippets(nil, {
  elixir = {
    s({trig = "fn", name = "fn", dscr = "Lambda function"}, {
      t("fn "),
      i(1, "args"),
      t(" -> "),
      i(2, "body"),
      t(" end ")
    }),

    s({trig = "echo", name = "echo", dscr = "Inspect with label"}, {
      t("IO.inspect("),
      i(1, "variable"),
      t(", label: \""),
      i(2, "label"),
      t("\")")
    }),

    s({trig = "pecho", name = "pecho", dscr = "Inspect in pipeline"}, {
      t("|> IO.inspect(label: \""),
      i(1, "label"),
      t("\")")
    }),

    s({trig = "shout", name = "shout", dscr = "Shout to terminal"}, {
      t("IO.puts(\"========> "),
      i(1, "t"),
      t("\")")
    })
  }
})
