# ---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
# ---
defmodule MyList do
  def len([]), do: 0
  def len([head | tail]), do: 1 + len(tail)

  def sum(n), do: sum(n, 0)
  defp sum(0, m), do: m
  defp sum(n, m), do: sum(n - 1, m + n)

  def log(m), do: IO.puts("TESTING: #{m}")
end

defmodule User do
  import MyList
  sja = "SJA"
  IO.puts("TESTING: #{sja}")
  # piping with anonymous functions requires construction below...
  MyList.sum(10) |> (&IO.puts("TESTING: #{&1}")).()
  # Can't use functions in modules in which they are defined...
  # so define log function in the MyList module...
  sum(1) |> log
  sum(2) |> log
  sum(3) |> log
  sum(4) |> log
end
