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
  def len([_head | tail]), do: 1 + len(tail)

  def sum(n), do: sum(n, 0)
  defp sum(0, m), do: m
  defp sum(n, m), do: sum(n - 1, m + n)

  def gcd(a, 0) do
    IO.puts("gcd(#{a},0)")
    a
  end

  def gcd(a, b) do
    IO.puts("gcd(#{a},#{b})")
    gcd(b, rem(a, b))
  end

  def log(m), do: IO.puts("TESTING: #{m}")
end

import MyList
gcd(2, 2) |> log
gcd(4, 8) |> log
gcd(8, 4) |> log
gcd(6, 9) |> log
gcd(128, 44) |> log
