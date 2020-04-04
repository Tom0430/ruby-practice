require'minitest/autorun'
require'./lib/gate'
require'./lib/ticket'
class GateTest < Minitest::Test
    def setup
        @umeda = Gate.new(:umeda)
        @mikuni = Gate.new(:mikuni)
        @juso = Gate.new(:juso)

    end

    def test_umeda_to_juso
        ticket = Ticket.new(150)
        @umeda.enter(ticket)
        assert @juso.exit(ticket)
    end
    def test_umeda_to_mikuni
        ticket = Ticket.new(150)
        @umeda.enter(ticket)
        refute @mikuni.exit(ticket)
    end
end
