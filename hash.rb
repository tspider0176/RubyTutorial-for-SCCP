# -*- coding: utf-8 -*-

hash = {Mike: 18,  John: 19,  Jakky: 28,  Mika: 20,  Karen: 22,  Mary: 19,  Chris: 28,  Mikky: 25 }
hash.each do |name, age|
  puts "#{name}: #{age}" if name[0] == "M" || name[0] == "C"
end
