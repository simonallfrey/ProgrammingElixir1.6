defmodule SandB2 do
  def center(list) do
    t = for s <- list, do: {String.length(s), s}
    #IO.inspect t
    {maxl,_} = t |> Enum.max
    #IO.inspect maxl
    for {l,s} <- t do
      IO.write String.duplicate(" ",div(maxl-l,2))
      IO.puts s
    end
  end

  def capitalize_sentences(s) do
    s
    |> String.split(". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end

  def tuple ~> index, do: elem(tuple,index)
end

import SandB2

list=["aye","aye","that's","a","lovely","bag","of","....strings....."]
list = ~w[aye aye that's a lovely bag of ...strings....]
t = for s <- list, do: {String.length(s), s}
center(list)
center(~w[cat zebra elephant])

Enum.random(1..10)
data = for i <- 'abcdefghijklmnopqrstuvwxyz', do: {List.to_string([i]),Enum.random(1..10)}
Enum.sort data
#say now we want to sort these data by the second element of the tuple...
Enum.sort(data, fn {_,x},{_,y}-> x<=y end )
# takes a mapper to get what to compare
Enum.sort_by(data, fn {_,x} -> x end )
# the same thing using elem to extract, rather than pattern matching
Enum.sort_by(data, &elem(&1,1) )
# the same, defining a ~> operator to access tuple elements
Enum.sort_by(data, &(&1~>1) )

"oh. a DOG. woof. " |> String.split(". ")
capitalize_sentences("oh. a DOG. woof. ")
