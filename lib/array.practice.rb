numbers = [1,2,3,4,5,6]

# new_numbers = []
# do,endの代わりに{}を使うことができる。短い式であればこっちで書くほうが見やすい
# numbers.each{|n| new_numbers << n * 10 }

new_numbers = numbers.map{ |n| n*10 }
p "new_numbers: #{new_numbers}"
# ブロックの中の処理をして新しい配列を作る
# "new_numbers: [10, 20, 30, 40, 50, 60]"

even_numbers = numbers.select{ |n| n.even? }
p "even_numbers: #{even_numbers}"
# 結果が真になるものを集めて配列を作る find_allメソッドでも同じ挙動
# "even_numbers: [2, 4, 6]"

non_multiples_of_three = numbers.reject{ |n| n % 3 == 0 }
p "non_multiples_of_three: #{non_multiples_of_three}"
# 結果が真になるものをのぞいて配列を作る
# [1, 2, 4, 5]

even_number = numbers.find{ |n| n.even? }
p "even_number #{even_number}"
# 戻り値が真になった最初の要素を返す
# 2

sum = numbers.inject(0){ |result, n| result + n }
p sum
# injectの引数が｜｜の第一引数resultに入って配列がnに順番に入っていく
# 21

week_except_sunday = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
week = week_except_sunday.inject('Sun'){ |result, n| result + n }
p "week: #{week}"
# "week: SunMonTueWedThuFriSat"


['ruby','java','perl'].map{|s|s.upcase}#=>["RUBY","JAVA","PERL"]
#こう書き換えられる
['ruby','java','perl'].map(&:upcase)#=>["RUBY","JAVA","PERL"]
# ①ブロック引数が1個だけである。
# ②ブロックの中で呼び出すメソッドには引数がない。
# ③ブロックの中では、ブロック引数に対してメソッドを1回呼び出す以外の処理がない。
# 3つの条件に当てはまるなら &: で省略できる
