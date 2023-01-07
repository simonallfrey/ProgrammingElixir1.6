# ---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
# ---
defmodule Chop do
  def midway(l..u), do: l+div(u-l,2)

  def play(answer,range) do
    guess = midway(range)
    IO.write "\n#{guess}? "
    guess(answer,range,guess)
  end

  defp guess(answer,range,answer), do: IO.puts "That's right!"

  defp guess(answer,_..high,guess) when guess < answer do
    IO.write "bigger"
    play(answer,(guess+1)..high)
  end


  defp guess(answer,low.._,guess) when guess > answer do
    IO.write "smaller"
    play(answer,low..(guess-1))
  end
end

import Chop

IO.puts Chop.midway(1..10)
play(17,1..820)
