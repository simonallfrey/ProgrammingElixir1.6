defmodule SJAflat do
  def flatten([]), do: []
  def flatten([h|t]), do:  flatten(h) ++ flatten(t)
  def flatten(e), do: [e]

  def timer do
    Stream.resource(
      fn ->
        # the number of seconds to the start of the next minute
        {_h,_m,s} = :erlang.time
        60 - s - 1
      end,
      fn
      # wait for the next second, then return its countdown
      0 ->
          {:halt, 0}
        count ->
          :timer.sleep(1000)
        { [inspect(count)], count - 1 }
      end,
      fn _ -> nil end
    )
  end

  def center(list) do
    lengths = list |> Enum.map(&String.length/1)
    # IO.inspect(lengths)
    # IO.puts("Simon")
    maxLength = lengths |> Enum.max
    for {word,length} <- List.zip([list,lengths]) do
      # IO.inspect({word,length})
      # String.pad_leading(word,length+div(maxLength-length,2)," ")
      String.duplicate(" ",div(maxLength-length,2))<>word
    end |> Enum.join("\n") |> IO.puts
  end

end

defmodule User do
  # IO.puts " "
  # IO.puts "         x   TESTING"
  SJAflat.center [
   "a long set of lines","follows","from","very very very bad behaviour",
 "a long set of lines","follows","from","very very very bad behaviour",
"a long set of lines","follows","from","very very very bad behaviour",
"a long set of lines","follows","from","very very very bad behaviour",
                 ]
end
