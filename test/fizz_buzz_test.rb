require'minitest/autorun'
require'./lib/fizz_buzz'
# 読み込まないとfizz_buzzがundefinedになる

class FizzBuzzTest < Minitest::Test
    def test_fizz_buzz
        assert_equal'1', fizz_buzz(1)
        assert_equal'2', fizz_buzz(2)
        assert_equal'fizz', fizz_buzz(3)
        assert_equal'4', fizz_buzz(4)
        assert_equal'buzz', fizz_buzz(5)
        assert_equal'fizz_buzz', fizz_buzz(15)
        # assert_equal'fizz_buzz', fizz_buzz(16)
    end
end

# fizzbuzz(16)でわざとエラーを起こすと
# FizzBuzzTest#test_fizz_buzz [lib/fizz_buzz.rb:23]:
# --- expected
# +++ actual
# @@ -1 +1,3 @@
# -"fizz_buzz"
# +# encoding: US-ASCII
# +#    valid: true
# +"16"