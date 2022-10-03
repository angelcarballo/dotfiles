local ls = require("luasnip")

-- some shorthands...
local snip = ls.snippet
-- local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
  elixir = {
    snip({trig = "fn", namr = "fn", dscr = "Lambda function"}, {
      text("fn "),
      insert(1, "args"),
      text(" -> "),
      insert(2, "body"),
      text(" end ")
    }),
    snip({trig = "echo", namr = "echo", dscr = "Inspect with label"}, {
      text("IO.inspect("),
      insert(1, "variable"),
      text(", label: \""),
      insert(2, "label"),
      text("\")")
    }),
    snip({trig = "pecho", namr = "pecho", dscr = "Inspect in pipeline"}, {
      text("|> IO.inspect(label: \""),
      insert(1, "label"),
      text("\")")
    }),
    snip({trig = "shout", namr = "shout", dscr = "Shout to terminal"}, {
      text("IO.puts(\"========> "),
      insert(1, "text"),
      text("\")")
    })
  }
})
