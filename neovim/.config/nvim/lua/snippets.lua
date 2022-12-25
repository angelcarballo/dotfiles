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
    s({ trig = "af", name = "Anonymous function", dscr = "Anonymous function" }, {
      t("& &1")
    }),

    s({ trig = "fn", name = "fn", dscr = "Lambda function" }, {
      t("fn "),
      i(1, "args"),
      t(" -> "),
      i(2, "body"),
      t(" end ")
    }),

    s({ trig = "echo", name = "echo", dscr = "Inspect with label" }, {
      t("IO.inspect("),
      i(1, "variable"),
      t(", label: \""),
      i(2, "label"),
      t("\")")
    }),

    s({ trig = "pecho", name = "pecho", dscr = "Inspect in pipeline" }, {
      t("|> IO.inspect(label: \""),
      i(1, "label"),
      t("\")")
    }),

    s({ trig = "shout", name = "shout", dscr = "Shout to terminal" }, {
      t("IO.puts(\"========> "),
      i(1, "t"),
      t("\")")
    }),

    s({ trig = "pdbg", name = "Pipe debug", dscr = "Pipe debug" }, {
      t("|> dbg()")
    }),

    s({ trig = "usedatacase", name = "use Duffel.Core.DataCase", dscr = "use Duffel.Core.DataCase" }, {
      t("use Duffel.Core.DataCase, async: true")
    }),

    s({ trig = "importham", name = "import Hammox", dscr = "import Hammox" }, {
      t("import Hammox, only: [expect: 3, verify_on_exit!: 1]", "setup :verify_on_exit!")
    }),

    s({ trig = "importdecimal", name = "import Decimal sigil", dscr = "import Decimal sigil" }, {
      t("import Duffel.Core.Sigils, only: [sigil_d: 2]")
    }),

    s({ trig = "importecto", name = "import Ecto.Query.from", dscr = "import Decimal sigil" }, {
      t("import Ecto.Query, only: [from: 2]")
    }),

    s({ trig = "rawquery", name = "Return raw sql for a given Ecto query", dscr = "Return raw sql for a given Ecto query" }
      , {
      t("Ecto.Adapters.SQL.to_sql(:all, Repo, )")
    }),

    s({ trig = "eex", name = "EEX tag", dscr = "EEX tag" }, {
      t("<%= "),
      i(1, "content"),
      t(" %>")
    }),

    s({ trig = "cmod", name = "__MODULE__", dscr = "__MODULE__" }, {
      t("__MODULE__")
    })
  }
})
