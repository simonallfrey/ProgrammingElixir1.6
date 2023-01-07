list = Enum.to_list(1..10_000)
map_fun = fn i -> [i, i * i] end
require Integer


# Benchee.run(%{
#   "body filter"    => fn -> MyList.filter(list, &Integer.is_even/1) end,
#   "stdlib"    => fn -> Enum.filter(list, &Integer.is_even/1) end,
#   "tail filter no reverse"    => fn -> MyList.filter4(list, &Integer.is_even/1) end,
#   "tail filter"    => fn -> MyList.filter3(list, &Integer.is_even/1) end,
#   "++ tail filter"    => fn -> MyList.filter2(list, &Integer.is_even/1) end
# })

Benchee.run(%{
  "body map"    => fn -> MyList.map(list, map_fun) end,
  "stdlib"    => fn -> Enum.map(list, map_fun) end,
  "tail map"    => fn -> MyList.mapt(list, map_fun) end,
  "tail ++ map"    => fn -> MyList.maptpp(list, map_fun) end,
})
