a = { 'x' => 1, 'y' => 2, 'z' => 3}
b = { 'z' => 3, 'y' => 2, 'x' => 1}
a == b #=> true 順番が違ってもキーとヴァリューのセットが全てあっているなら同じものとして扱う


currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# currencies={japan:'yen',us:'dollar',india:'rupee'}　上の行と中身は一緒

currencies.delete('italy')#=>nil
currencies.delete('italy'){|key|"Notfound:#{key}"}
#=> "Notfound:italy"  キーが見つからない時の戻り値をブロックで設定できる

# シンボルはSymbolクラスのオブジェクト
# 文字列はStringクラスのオブジェクト
# シンボルはrubyの内部で整数として管理される、文字列よりも高速に値を比較できる
# 同じシンボルであれば全く同じオブジェクトである
# シンボルはイミュータブルで文字列のように破壊的な変更ができない

p :apple.object_id #=> 995548
p :apple.object_id #=> 995548
p 'apple'.object_id #=> 70148451093260
p 'apple'.object_id #=> 70148451092920
