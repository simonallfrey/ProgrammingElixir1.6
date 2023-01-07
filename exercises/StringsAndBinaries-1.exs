defmodule SandB do
  def printable?(l), do: Enum.all?(l,&(?\s<=&1 && &1<=?~))

  def anagrams(w1,w2), do: Enum.sort(w1) == Enum.sort(w2)

  def calculate(s), do: calculate(s,0)
  defp calculate([],r), do: r
  defp calculate([?\s|t],r), do: calculate(t,r)
  defp calculate([?+|t],r), do: r+calculate(t,0)
  defp calculate([?-|t],r), do: r-calculate(t,0)
  defp calculate([?/|t],r), do: r/calculate(t,0)
  defp calculate([?*|t],r), do: r*calculate(t,0)
  defp calculate([d|t],r) when d in '0123456789' do
    calculate(t,r*10+d-?0)
  end
  defp calculate([x|_],_), do: raise "Invalid token '#{[x]}'"


  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str),           do: _number_digits(str,  0)

  defp _number_digits([], value), do: value
  defp _number_digits([ digit | tail ], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([ non_digit | _ ], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
  def i(x), do: IO.inspect x
  def p(x), do: IO.puts x
end

import SandB

calculate('1 0 1  / 2 0')
calculate('32*2')
calculate('32*2-1')
calculate('32*2-1+3/2')
calculate('32*2-1+3/2😽')

printable?('abd')
printable?('🤖')

anagrams('simon','nomis')

Enum.sort('simon') == Enum.sort('nomis')

[a,b|[?+|d]='10+20'

String.split("10+20",~r|(\d+)([-+*/])(\d+)|)

{val,_}=Code.eval_string('10+20');val


#IEEE 754
<< sign::size(1), exp::size(11), mantissa::size(52) >> = << 3.14159::float >>
(1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp-1023) * (1 - 2*sign)
{sign,exp,mantissa}
# 1 <= 1+mantissa/:math.pow(2,52) < 2
1+mantissa/:math.pow(2,52)
require Integer
{maxman,_} = List.duplicate(?1,52) |> List.to_string |> Integer.parse(2)
maxman /:math.pow(2,52)

0b1111111111111111111111111111

"1111111111111111111111111111111"|>Integer.parse(2)
#easier way to get binary of 52 '1's  2^53-1
(:math.pow(2,53)-1)/:math.pow(2,52)

0b110+3
0xf
0o10

String.graphemes "noe\u0308l"
String.codepoints "noe\u0308l" |> IO.inspect
l = String.codepoints "noe\u0308l"
h(l)
h(IEx)
i l
q = l|>Enum.at(3)
i q
"a" ++ q
"a\u0308" |> String.printable?
"\u0308" |> String.printable?
#Can use zero width lookbehind/lookahead to split after or before a 't'
String.split "The cat sat on the mat", ~r{(?<=t)}
String.split "The cat sat on the mat", ~r{(?=t)}
