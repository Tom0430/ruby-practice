# =~を使うとマッチしたか判定できる
if'1234567' =~ /\d{3}\d{4}/
    puts'マッチしました'
else
    puts'マッチしませんでした'
end#=>マッチしました

/\d{3}\d{4}/ =~ '1234567'#=>0
/\d{3}\d{4}/ =~ 'hello'#=>nil

'hello' !~ /\d{3}\d{4}/#=>true

text='私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
# 文字列に正規表現がマッチするとMatchDataオブジェクトが返ってくる
m #=> <MatchData "1977年7月17日" 1:"1977" 2:"7" 3:"17">
p m[0]#=>"1977年7月17日" テキスト全体が入る
p m[1]#=>"1977"
p m[2]#=>"7"
p m[3]#=>"17"
m[2,2]#=>["7","17"] キャプチャの二番目から２個取得


text='私の誕生日は1977年7月17日です。'
# キャプチャに名前をつける
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# シンボルでも文字列でも
m[:year]#=>"1977"
m["year"]#=>"1977"
m[:month]#=>"7"
m[:day]#=>"17"

# 引数に渡した正規表現にマッチする部分を配列で返す
'123456789'.scan(/\d+/)#=>["123","456","789"]
p '1977年7月17日 2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)#=>[["1977","7","17"],["2016","12","31"]]


text = '123-4567 456-7890'
text[/\d{3}-\d{4}/]#=>"123-4567" 最初にマッチしたものを返す


text = '郵便番号は123-4567です'
text.slice(/\d{3}-\d{4}/)#=>"123-4567"
text#=>"郵便番号は123-4567です"
text.slice!(/\d{3}-\d{4}/)#=>"123-4567"  破壊的
text#=>"郵便番号はです"

text = '123,456-789'
# 第一引数に渡した文字を第二引数の文字に置き換える
p text.gsub(',',':')#=>"123:456789"
p text.gsub(/,|-/,':')#=>"123:456:789" -または,を:に置き換える
