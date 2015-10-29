# -*- coding: utf-8 -*-

p "hogehoge" #=>"hogehoge" ←文字列の形を維持している。
arr = ['a', 'b', 'c']
p arr #=> ["a", "b", "c"] ← 配列の形を維持している。
p arr.length #=> 3 配列の長さを表示
p arr *= 2 #=> ["a", "b", "c", "a", "b", "c"]
p arr.include? "c" #=> true 特定の値を含むかどうか
p arr.sort #=> ["a", "a", "b", "b", "c", "c"] 新しい配列を生成して返す
arr.uniq! # ["a",  "b",  "c"] 重複要素を削除
p arr.join(':') #=> "a:b:c" 指定した文字列で区切って要素を表示
