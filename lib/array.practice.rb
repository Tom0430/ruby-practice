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


# a = [1,2,3,1,2,3]
# a.delete_if do |n|
#     n.odd?
# end
# a #=> [2,2]


# a = [1,2,3,1,2,3]
# a.delete(2) #=>[1,3,1,3]
# 引数に渡したものと一致したものを削除

a = [1]
b = [2,3]
a.concat(b)
a #=> [1,2,3]　配列の連結 aが書き換わるから破壊的であるという

a = [1]
b = [2,3]
c = a + b #[1,2,3]　この場合はaもbも変更なし(非破壊的)

a = [1,2,3]
b = [3,4,5]
c = a|b #=> [1,2,3,4,5] 和集合を求めてくれる
d = a&b #=> [3] 積集合　どっちにも属している要素
e = a-b #=> 差集合　[1,2] 左の配列から右の配列の要素を取り除く
# 本格的な集合演算をしたいならSetクラスがある

a = []
b = [2,3]
a.push(1) #=> [1]
a.push(b) #=> [1,[2,3]]　配列のまま入ってしまう
a.push(*b)


# 頭に*をつけると、個数制限のない可変長引数になる　
# 可変長引数は配列として受け取ることができる
def greeting(*names)
    "#{names.join('と')}、こんにちは"
    # joinメソッドは、引数の区切り文字を使って配列を１つの文字列にするメソッド
end
p greeting('鈴木さん') #=>鈴木さん、こんにちは
p greeting('鈴木さん','佐藤さん') #=>鈴木さんと佐藤さん、こんにちは

# 文字列であれば％記法でも配列が作れる
%w!apple melon orange! #=>["apple","melon","orange"]
%w(apple melon orange!) #=>["apple","melon","orange"]

'Ruby,Java,Perl,PHP'.split(',') #=>["Ruby","Java","Perl","PHP"]

a = Array.new(5) #=>[nil,nil,nil,nil,nil]
a = Array.new(5,0) #=>[0,0,0,0,0] 第二引数で初期値を設定できる
'Ruby,Java,Perl,PHP'.split(',')#=>["Ruby","Java","Perl","PHP"]

# ブロックを使って初期値の設定ができる
a=Array.new(10){|n|n%3+1}
a#=>[1,2,3,1,2,3,1,2,3,1]

# with_indexの引数に初期値を渡せる
# mapやdelete_ifなどのメソッドにもwith_indexは使える
fruits.each.with_index(1){|fruit,i|puts"#{i}:#{fruit}"}
#=>1:apple
#2:orange
#3:melon

a=[]
10.upto(14){|n|a<<n}
a #=>[10,11,12,13,14]　10から14まで処理を繰り返す　down_toもある

a=[]
1.step(10,2){|n|a<<n}
a #=>[1,3,5,7,9]　１から１０まで２ずつ飛ばしながら処理をする
