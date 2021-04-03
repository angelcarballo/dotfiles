let g:projectionist_heuristics = {
  \    "mix.exs": {
  \      "lib/*.ex": {
  \        "type": "lib",
  \        "make": "mix",
  \        "alternate": "test/{}_test.exs",
  \        "template": [
  \          "defmodule {dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize} do",
  \          "end"
  \        ]
  \      },
  \      "test/*_test.exs": {
  \        "type": "test",
  \        "make": "iex -S mix test",
  \        "alternate": "lib/{}.ex",
  \        "template": [
  \          "defmodule {dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize}Test do",
  \          "  use ExUnit.Case, async: true",
  \          "",
  \          "  alias {dirname|camelcase|capitalize|dot}.{basename|camelcase|capitalize}",
  \          "end"
  \        ]
  \      }
  \    }
  \  }
