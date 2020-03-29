def convert_hash_syntax(old_syntax)
    old_syntax.gsub(/:(\w+)+ *=> */,'\1:')
    # \1は一番目にキャプチャされた文字を表している name:　のようになる
end