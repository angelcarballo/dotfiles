defmodule AC do
  def copy(term) do
    text =
      if is_binary(term) do
        term
      else
        inspect(term, limit: :infinity, pretty: true)
      end

    port = Port.open({:spawn, "pbcopy"}, [])
    true = Port.command(port, text)
    true = Port.close(port)

    :ok
  end

  def exit, do: System.halt
end

import AC

# Map keys seem randomly ordered since OTP 26, sort them by default when inspecting
IEx.configure(inspect: [custom_options: [sort_maps: true]])
