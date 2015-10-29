# -*- coding: utf-8 -*-

arr = ['a', 'b', 'c']
arr.each do |item|
  print item + " " #=> a, b, c
end

puts

arr.each_with_index do |item, index|
  p [item, index]
end
#=> ["a", 0]
#=> ["b", 1]
#=> ["c", 2]

arr = ['abc',  'def',  'ghi']
upper_arr = arr.map do |item| # 破壊的なmap!メソッドも存在する。
    item.upcase
end
p upper_arr
upper_arr = arr.map {|item| item.upcase}  # このように短く書くことも。
p upper_arr
p arr.map(&:upcase) # さらに短く

puts (1..100).to_a.inject { |sum, n| sum + n} # 5050
puts (1..100).to_a.inject(:+)

