defmodule MyList do
  def max([]), do: nil
  def max([a, b]) when a > b, do: a
  def max([_, b]), do: b
  def max([h | t]), do: max([h, max(t)])

  def reduce([],v,_), do: v
  def reduce([h|t],v,func), do: reduce(t,func.(h,v),func)

  def mapsum(l,f), do: reduce(l,0,&(&2 + f.(&1)))

  def map([],_f), do: []
  def map([h|t],f), do: [f.(h),map(t,f)]



  # Some different ways of defining constants...
  def a() do
    [val]='a'
    val
  end
  def aA() do
    [val]='A'
    val
  end

  @a List.first('a')
  @aA List.first('A')


  def test(), do: IO.puts "a is #{@a}, aa is #{@aA}"
  def test2(), do: IO.puts "a is #{a}, aa is #{aA}"

  def ceaser(l, k \\ 13)
  def ceaser([],_k), do: []
  def ceaser([h|t],k), do: [kshift(h,k),ceaser(t,k)]
  def kshift(h,k) when 'a' <= [h] and [h] <= 'z' and [h+rem(k,26)] > 'z', do: h+rem(k,26)-26
  def kshift(h,k) when 'A' <= [h] and [h] <= 'Z' and [h+rem(k,26)] > 'Z', do: h+rem(k,26)-26
  def kshift(h,k), do: h+rem(k,26)

  def span(from,to), do: Enum.to_list(from..to)
  def span2(from,to) when from > to, do: span2(to,from)
  def span2(from,to), do: span2(from,to,[])
  defp span2(to,to,l), do: [to|l]
  defp span2(from,to,l), do: span2(from,to-1,[to|l])

  def i(j), do: IO.inspect(j)
end


defmodule User do

import MyList

i span2(4,4)
i span2(4,7)
i span2(-7,4)
i span(-7,4)
i List.foldl([1,2,3],"start", fn e,s -> "#{e}--#{s}"   end)
i List.foldr([1,2,3],"start", fn e,s -> "#{e}--#{s}"   end)



# IO.puts max([1,2,4])
# IO.puts max([24,2])
# IO.puts max([])
# max([224,225])

# IO.puts reduce([1,2,3,4,5], 0, &(&1+&2))

# IO.puts mapsum([1,2,3,4,5],&(&1*&1))
# IO.puts ceaser('AasimonzZ')
# test
# test2
# al='abcdefghijklmnopqrstuvwxyz'
# IO.puts map(al,&(kshift(&1,1)))
# IO.puts map(al,&(kshift(&1,25)))
# IO.puts map(al,&(kshift(&1,26)))

# IO.puts al |> map(&(kshift(&1,2)))
# IO.puts List.first('a')..(List.first('z')) |> Enum.to_list

end

list = [1,2,4]
List.replace_at(list,1,'borg')
