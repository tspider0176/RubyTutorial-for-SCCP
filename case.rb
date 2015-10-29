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


