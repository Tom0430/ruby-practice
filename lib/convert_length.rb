# def convert_length(length,from:unit_from,unit_to)
UNITS = { m: 1.0, ft: 3.28, in: 39.37 }  #Rubyの定数は大文字、実際に小文字だとなぜかエラーがでた
def convert_length(length, from: :m, to: :m )  #初期値を設定

    # units = { 'm' => 1.0, 'ft' => 3.28, 'in' => 39.37 }
    # これをシンボルに直すのであれば引数の方もシンボルにする
    # シンボルと文字列は互換性がない

    (length/ UNITS[from] * UNITS[to]).round(2)
    # 小数点第３位で四捨五入
end