# 課外プロジェクト 2015 実践的プログラミング
## ~ Ruby I ~
2015 10/29 渡部未来・齊藤智博  
資料URL: https://github.com/tspider0176/RubyTutorial-for-SCCP

## 1 はじめに
Rubyは日本人、まつもとゆきひろ(通称Matz)の手によって開発された、オブジェクト指向・スクリプト言語である。
この２つの考え方が、会津大学の主要言語であるC言語ではなく、Rubyを採択した大きな理由の一つである。

スクリプト言語(またはインタプリタ言語)は、コンピュータにとって実行可能な状態にする手順「コンパイル」を
挟まずに、インタプリタにより逐次解釈・実行を行う言語形式のことを言う。簡単に図で表すと以下のようになる。

ソースコード → コンパイラ [変換] → 実行可能ファイル [実行]

スクリプト → インタプリタ [逐次解釈・実行]

コンパイラによるコンパイル手順を挟まないので、プログラム作成から実行までの手順が簡単であることが大きな特徴として挙げられる。
また厳密な定義ではないが、ユーザが明示的に型を付ける(静的型付)とは違い、型を明示的に付けない(動的型付)ので、
簡単なプログラムであれば短いプログラムで書くことができるのも、特徴として挙げられる。
一方コンパイル言語の実行ファイル(機械語・アセンブリ言語)と比べて逐次解釈を行うので実行速度が比較的遅いことや、
型が無いことで複雑に成る程プログラムが読み難くなることが欠点として挙げられるケースが多い。
スクリプト言語の例として、前回.bashの設定で皆さんに書いてもらったシェルスクリプトやJavaScriptなどが挙げられる。

オブジェクト指向は現在、多くのプログラミング言語で採用されている、プログラムを構築する上での考え方(パラダイム)の一つである。
オブジェクト指向では、値をモノ(オブジェクト)として考える。言語によって考え方が異なるケースがあるが基本的には、
オブジェクトは状態(変数)と振る舞い(関数)を持つ構造のことである。このような構造を持つことで、
プログラムの変更に対して強固になる・再利用が容易になる・プログラムの簡略化ができる、などの利点を得ることができる。
SCCPでは、この考え方を主に学びながらアプリケーション作りに役立てていく。

## 1.2 スクリプトの実行
スクリプト言語の特徴を持ったRubyのプログラムを書いて実行する場合の手順は、コンパイラ言語とそう変わりはない。
「rb」の付いた拡張子のファイルを作成し、エディタを使ってスクリプトを記述する。

hello.rb
```
# -*- coding: utf-8 -*-

puts 'HelloWorld!'  #=> HelloWorld! と出力される。
```
上のようにスクリプトが記述できたら、以下のように実行をしてみよう。
```
$ ruby hello.rb
HelloWorld!
```
スクリプトの一行目は、スクリプト中に日本語を使うためのおまじないである。日本語を特に使わない場合は付けなくても構わない。
付けない場合は実行エラーになってしまうので注意が必要だ。putsは、文字列を出力するメソッド(関数のこと)で、末尾に改行を自動的に付けてくれる。
改行を末尾に付けないprintメソッドも用意されている。# から始まると、以降はコメントとしてみなされる。
資料では #=> と書いた場合は、プログラムの実行結果をあらわす。Rubyの練習では、AOJと呼ばれるオンラインジャッジシステムを使っていく。
確認の意味を込めて、以下の問題を解いてみよう。

- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_1_A  

Rubyは以上のようにファイルにプログラムを書く以外にも、プログラムを実行する対話型シェル(REPL)を備えている。
REPLは*irb*とターミナルに打つことで起動ができる。
```
$ irb
irb(main):001:0> 1+1
=> 2
irb(main):002:0> puts 'Hello'
Hello
=> nil
irb(main):003:0> 123.to_s
=> "123"
irb(main):004:0> exit
$
```
REPLでは任意のプログラムを打つことができ、実行結果が => の後に出力される。C-d、もしくは'exit', 'quit'とタイプすれば終了できる。
単なる高度な計算機として使うことや知らないオブジェクトやメソッドの挙動を確かめるときに、型などを確認できるので非常に便利である。
この資料でも、プログラムの挙動を確かめるときにはREPLを積極的に使用していく。

## 2 制御式
RubyではC言語などの他のプログラミング言語と同様に制御を行う機能が備わっている。
その使い方と違いについて説明していく。

### 2.2 if式
rubyにおけるif式の基本的な構文は以下の形になる。

```
if [条件式] then
	[被制御式]
end

# 複数条件ある時のif式 (elseif ではないことに注意！)
if [条件式1] then
  [被制御式1]
elsif [条件式2] then
  [被制御式2]
elsif ...
...
else
  [被制御式n]
end
```

if式の構造を覚えたら、以下の例を試してみよう。

if.rb
```
# -*- coding: utf-8 -*-

x = 10
if x == 1 then
  puts '1'
elsif x < 5 then
  puts '5より小さい'
else
  puts '5以上'
end
```

もしelse節がなく、条件式単体の文を実行したい時には以下のように書くことができる。
```
# if制御式の書き方
[被制御式] if [条件式]
```
```
irb(main):001:0> x=10
=> 10
irb(main):002:0> x=x*2+1 if x % 2 == 0
=> 21
irb(main):003:0> x=x*2+1 if x % 2 == 0
=> nil
irb(main):004:0> x
=> 21
```
非常に短くプログラムを書くことができるので、よく使われるテクニックのひとつである。

もし条件式に != を使う場合には、条件式が偽のときに実行されるunless構文を使うのも手だ。
```
unless [条件式] then
  [被制御式]
end
```

Rubyではifは文ではなく、式として評価することができる。
文との違いを示すためにC言語との比較を以下に示す。

if_exp.c
```
# -*- coding: utf-8 -*-

int x, y; // 宣言が必要。
scanf("%d", &x);
if(x % 2 == 0){
	y = x * 2; 		 // 代入が逐一必要。
}else{
	y = x * 3;     // 代入が逐一必要。
}
printf("%d\n", y);
```

if_exp.rb
```
x = STDIN.gets.to_i # 標準入力を受け取り、整数に変換する。
y = if x % 2 == 0 then  # ifの結果をyに代入
	x * 2   # 式(右辺)のみを記述
else
	x * 3
end
puts y
```
以上の例は、xが偶数なら2倍、奇数なら3倍にして返すif式の結果をyに代入している。
Rubyの関数やifでは、最後に評価される値を結果として返していることがわかる。

if式の使い方が習得できているかの確認のために以下の問題を解いてみよう。

- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_A
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_B

補足
```
# 以下のように書くと空白区切りの文字を数字に変換しつつ、a,bに代入することができる。
a, b = STDIN.gets.split.map(&:to_i)
```

### 2.3 case式
rubyにおけるcase式は、C言語におけるswitch-case文に相当するものであり、値による多岐分岐を提供してくれている。

```
# Rubyのcase式
case [変数]
when [値] then
  [処理]
when [値] then
  [処理]
...
else
  [処理]
end
```
上のcase式では、まずcaseの後に置かれた[変数]が評価され、次にその値に対応するwhen節が選ばれた後にthen節が実行され、
最後に評価された式がcase式全体の値になり、返却される。このcase式もif式と同じく、区切りが明確であればthenは省略可能である。

Rubyのcase式は整数・文字、だけでなく任意の型を記述することができる。
非常に面白い例として範囲をあらわすRange型を使用してみる。

case.c
```
# -*- coding: utf-8 -*-

int x;
while(1){
	scanf("%d", &x);
	switch(x){
		case 0:
		case 1:
		case 2:
		case 3:
			printf("0~3の間");
		...
		default:
			printf("範囲外なので終了。");
			break;
	}
}
```

case.rb
```
# -*- coding: utf-8 -*-

puts '0~10の間の数字を入力してください。(範囲の外に出たら終了。)'
loop{ # 無限ループをするメソッド
  case STDIN.gets.to_i
  when 0..3   #  範囲をあらわすRange型
    puts '0~3の間'
  when 4..7
    puts '4~7の間'
  when 8..10
    puts '8~10の間'
  else
    puts '範囲外に出たので終了します。'
    break
  end
}
```
case式の使い方を覚えたら次の問題を解いてみよう。

- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_C  

### 2.4 while式
#### 2.4.1 構文
C言語でも登場したループを表す制御構文のうち、本節ではwhlie式を紹介する。while式はrubyの中で最も単純な繰り返し構造であり、条件式が成立している間、被制御ぶの式を繰り返し評価し続ける。while式は以下のように書くことが出来る。

```
# Rubyのwhile式、doは省略可能
while [条件式] do
  [被制御部]
end

# if式などと同様にwhile修飾子が存在している。
[被制御部] while [条件式]
```

### 2.5 for式
この式はC言語などで用いる場面と同じく、配列の操作などに長けている。以下にその構文を示す。

```
# doは省略可能
for [変数] in [オブジェクト] do
  [被制御部]
end
```

実際にfor文を用いて繰り返し処理を実行してみよう。
例えば、1から10までの和を求めるfor式は以下のようになる。

```
# 1から10までの和をfor式で求める
sum = 0
for i in 1..10 do   # ここでもRange型が役に立つ。
  sum = i + 1
end
```

おまけに、timesという面白いメソッドを紹介しよう。これはカウンタ変数を使用せず、指定された回数だけ処理を繰り返したときに使う。

```
10.times {
	puts 'まわる〜まわる〜 10かい まわる〜'
}
```

forとtimesメソッド両方を使い、以下の問題を解いてみよう。
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_3_A

## 3 配列
制御構文を通して、RubyとC言語との違いを説明してきた。しかし配列の仕組みはC言語と比べてまったくと言っていいほど別物である。
資料冒頭でRubyはオブジェクト指向言語であると言ったことを思い出して欲しい。Rubyにおいて、配列もオブジェクトであり振る舞い(メソッド)を持っている。
以降、配列の基本的な使い方とメソッドの動きを説明していく。

配列はArrayオブジェクトは、newメソッドを呼び出すことで生成することが出来る。
メソッドの引数には配列の大きさを指定する必要がある。初期化ではすべての要素にnil(値が無いことを示す値)で埋められる。
C言語同様に[]で添字を指定して参照したり、代入したりすることができる。
```
irb(main):001:0> arr = Array.new(3) // 大きさ3の配列
=> [nil, nil, nil]
irb(main):002:0> arr[0] = 1
=> 1
irb(main):003:0> arr
=> [1, nil, nil]
```
配列はリテラル表記(直接的な書き方)ができ、それによって配列を生成することもできる。
また、添字が循環しており-1で末尾の要素を指定することなどもできる。
```
irb(main):001:0> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
irb(main):002:0> arr[-1]
=> 10
```
ちなみに、Range型は配列型に変換するメソッドを備えている。
```
irb(main):001:0> (1..10).to_a
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

冒頭で述べた通り配列はオブジェクトなので、配列の使えるメソッドを一気に紹介する。
pメソッドはオブジェクトの形を維持したまま、出力するとても便利なメソッドだ。

arr.rb (REPLで確認しても良い)
```
p "hogehoge" #=> "hogehoge" ←文字列の形を維持している。
array = ['a', 'b', 'c']
p arr #=> ["a", "b", "c"] ← 配列の形を維持している。
p arr.length #=> 3 配列の長さを返す。
p arr *= 2 #=> ["a", "b", "c", "a", "b", "c"]
p arr.include? "c" #=> true 特定の値を含むかどうか
p arr.sort #=> ["a", "a", "b", "b", "c", "c"] 配列を並び替える
arr.uniq! #=> ["a",  "b",  "c"] 重複要素を削除
p arr.join(":") #=> "a:b:c" 指定した文字列で要素を区切った文字列を生成
```

ここで、メソッドの名前について注目してもらいたい。?と!で終わっているものがあると思われる。
これは特別な機能ではなく、単純にメソッド名に記号が使うことができるだけである。
しかし、習慣として?で終わるメソッドは真偽値(true, false)を返すメソッド、!で終わるメソッドは破壊的な処理を行うメソッドである。
破壊的な処理とは、元のオブジェクトの状態を変更してしまうようなメソッドをあらわす。
大体の場合は非破壊的メソッドも対で用意されていることが多い。*sort*や*uniq*メソッドがこれに当たる。

```
irb(main):001:0> arr = [1, 1, 3, 2, 4, 5]
=> [1, 1, 3, 2, 4, 5]
irb(main):002:0> p arr.sort
[1, 1, 2, 3, 4, 5]          # 表示はソート済み
=> [1, 1, 2, 3, 4, 5]       # 戻り値もソート済みだが・・・
irb(main):003:0> p arr
[1, 1, 3, 2, 4, 5]          # 元の配列は配列は変更されていない(非破壊的メソッド)
irb(main):004:0> arr.sort!  # しかし破壊的なメソッドを呼び出すと・・・
=> [1, 1, 2, 3, 4, 5]
irb(main):005:0> p arr      # 元の配列も変更されてしまう(破壊的メソッド)
[1, 1, 2, 3, 4, 5]
```

配列のメソッドを利用して以下の問題を解いてみよう。

- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_2_C
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_6_A
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_5_A (ちょっと難しめ？)
- 参考: [Array - Rubyリファレンス] http://ref.xaio.jp/ruby/classes/array

これまでに、いくつかの配列のメソッドについて触れた。
ここで配列のブロック付きメソッドとイテレータについて説明をする。

以下がブロック付きメソッドとイテレータの例である。

```
# -*- coding: utf-8 -*-

arr = ['a', 'b', 'c']
arr.each do |item|
  print item + " " #=> a, b, c
end
```

まず初めに配列は、*each*と言う名前のメソッドを呼び出している。
eachメソッドは、ブロックを引数として受け取る。
ブロックにあたるのが、*do*から*end*キーワードまでである。
ブロックは引数を持つことができ、|引数, …|という形で書くことができる。
引数は、イテレータにより配列の要素が一つ一つ送り込まれ、ブロックの中の文が評価される。
図で書くと以下のような形だ。

```
   ↓
['a', 'b', 'c']
['b', 'c']   ->  item = |"a"|  ->   print "a"
['c']        ->  item = |"b"|  ->   print "b"
[]           ->  item = |"c"|  ->   print "c"
```

配列の添字が必要なケースがある場合は、*each_with_index*メソッドを使おう。
このメソッドはブロックの最初の引数が配列から来た値で、2つ目の引数が添字になっている。
```
arr.each_with_index do |item, index|
  p [item, index]
end
#=> ["a", 0]
#=> ["b", 1]
#=> ["c", 2]
```

配列の各々の要素に対して何か処理を施して、その結果を再び配列としてまとめたい場合がある。
そのときは*map*メソッドを使う。最後に評価された値が再び配列の要素となる。

```
arr = ['abc', 'def', 'ghi']
arr.map do |item|
  item.upcase
end
p arr #=> ["ABC", "DEF", GHI]
```

また、do ~ endの構文は波括弧で記述することもできる。

```
p arr.map{|item| item.upcase}
```

さらに、省略して書くこともできます。

```
p arr.map{&:upcase}
```

mapメソッドの動きを図にすると以下の様な形になる。

```
['abc', 'def', 'ghi']
['def', 'ghi']   ->  item = |"abc"|  ->   ['ABC']
['ghi']  	       ->  item = |"def"|  ->   ['ABC', 'DEF']
[]               ->  item = |"ghi"|  ->   ['ABC', 'DEF', 'GHI']
```

最後に畳み込みを行う*inject*メソッドを紹介する。
畳み込みとは配列を順に見ていくときに、用意した値に対して配列の要素を演算していく(畳み込んでいく)。
例えば、足し込んで行く場合は以下のようになる。

```
puts (1..100).to_a.inject { |sum, n| sum + n} # 5050 nが用意した値。初期値として0が代入されている。
```
以下のように省略することもできる。
```
puts (1..100).to_a.inject(:+)
```

以上で配列は終わりとなる。多くの便利なメソッドが用意され、非常に柔軟な処理ができることがわかったと思う。
最後に配列に関する問題を用意するので、解いてみてほしい。

- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=ITP1_4_D (全て畳み込み演算で求めてみよう。)
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0102&lang=jp

## 4 ハッシュ
ハッシュとは、任意のオブジェクトをキーとして別のオブジェクトに対応付けるコンテナオブジェクトである。
配列の場合は添字(整数)をキーとして別のオブジェクトに対応付けるコンテナオブジェクトと言える。
Rubyでは、シンボルという文字列(のように見えるもの)をキーとしてとしてハッシュを書くのがベターとされている。
以下にハッシュの構築方法と、アクセス方法を示す。

```
hash = {one: 1, two: 2, three: 3}
p hash[:one] #=> 1
p hash[:two] #=> 2
hash[:five] = 5 # 新しいキーとバリューの組み合わせ。
p hash       #=> {:one=>1, :two=>2, :three=>3, five=>5}
```

ハッシュも多くのメソッドを備えているが、とりあえずは配列の要領でリファレンスを見てもらうことにする。

- http://docs.ruby-lang.org/ja/2.1.0/class/Hash.html

ハッシュにも配列同様にイテレータをサポートしているメソッドを持っている。

```
hash = {Mike: 18,  John: 19,  Jakky: 28,  Mika: 20,  Karen: 22,  Mary: 19,  Chris: 28,  Mikky: 25 }
hash.each do |name, age|
  puts "#{name}: #{age}" if name[0] == "M" || name[0] == "C" # 頭文字がMとCの人だけ表示する。
end
```
ハッシュを自由自在に使えると応用が効きやすいので、覚えると良い。
以下にハッシュが使えるような問題を以下に用意した。少々難しい問題かもしれないが、是非こちらも挑戦してみて欲しい。
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0088
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0105
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0201
- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0242

## 参考資料
- 初めてのRuby O'REILLY Japan　Yugui著  
- http://www.oki-osk.jp/esc/ruby/tut-01.html  
- http://docs.ruby-lang.org/ja/2.0.0/doc/index.html  
