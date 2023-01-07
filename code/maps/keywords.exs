#---
# Excerpted from "Programming Elixir ≥ 1.6",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/elixir16 for more book information.
#---
defmodule Canvas do

  @defaults [ fg: "black", bg: "white", font: "Merriweather" ]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts "Drawing text #{inspect(text)}"
    IO.puts "Foreground:  #{options[:fg]}"
    IO.puts "Background:  #{Keyword.get(options, :bg)}"
    IO.puts "Font:        #{Keyword.get(options, :font)}"
    IO.puts "Pattern:     #{Keyword.get(options, :pattern, "solid")}"
    IO.puts "Style:       #{inspect Keyword.get_values(options, :style)}"
  end

end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")

"hello"

sMap = %{"A" => "AYE", a: "aye", b: "bee"}
sMap.a
sMap["A"]
%{"A" => word} = sMap
word
sMap |> Enum.filter(fn {:a,_} -> false; _ -> true; end) |> Map.new()
numbers=Enum.to_list(5..15)
for n <- numbers, do: n*n

people = [
%{ name: "Grumpy", height: 1.24 },
%{ name: "Dave", height: 1.88 },
%{ name: "Dopey", height: 1.32 },
%{ name: "Shaquille", height: 2.16 },
%{ name: "Sneezy", height: 1.28 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)

IO.inspect(for %{ height: height } = person  <- people, height > 1.5, do: person)

IO.inspect(for person  <- people, person.height > 1.5, do: person)

defmodule HotelRoom do
  def book(%{name: name, height: height}) when height > 1.9 do
    IO.puts "Need extra-long bed for #{name}"
  end
  def book(%{name: name, height: height}) when height < 1.3 do
    IO.puts "Need low shower controls for #{name}"
  end
  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end
end

people |> Enum.each(&HotelRoom.book/1)

IEx.configure(inspect: [charlists: :as_lists])

Enum.split([10,20,30,40,50,60,70,80],4)

x = 'hadsbasdfasf'
'hadsbasdfasf'

#=> Need low shower controls for Grumpy
# =>
#   Drawing text "hello"
#   Foreground:  red
#   Background:  white
#   Font:        Merriweather
#   Pattern:     solid
#   Style:       ["italic", "bold"]
