defmodule MapSum do
  def reduce([],v,_) do
    v
  end
  def reduce([h|t],v,f) do
    reduce(t,f.(v,h),f)
  end

  def ms(l,f) do
    reduce(l,0,&(&1 + f.(&2)))
  end


  def map_sum(a, f) do
    map_sum(a, 0, f)
  end

  def map_sum([], c, _f) do
    c
  end

  def map_sum([h | r], c, f) do
    map_sum(r, c + f.(h), f)
  end

  def my_max([h | r]), do: my_max(r, h)

  def my_max([], c), do: c

  def my_max([h | r], c) when h > c, do: my_max(r, h)

  def my_max([_h | r], c), do: my_max(r, c)

  def ceasar(l, n \\ 13)

  def ceasar([], _n), do: []

  def ceasar([h | r], n) when 'a' <= [h] and [h] <= 'z' and [h + n] > 'z',
    do: [h + n - 26 | ceasar(r)]

  def ceasar([h | r], n) when 'A' <= [h] and [h] <= 'Z' and [h + n] > 'Z',
    do: [h + n - 26 | ceasar(r)]

  def ceasar([h | r], n), do: [h + n | ceasar(r)]

  def fact(0), do: 1

  def fact(x), do: x*fact(x-1)

  def fact2(0), do: 1

  def fact2(x), do: [x| fact2(x-1)]
 end
