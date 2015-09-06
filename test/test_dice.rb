require 'minitest/autorun'
require 'shoulda/context'
require 'dice'

class TestDice < Minitest::Test
  context 'Dice rolls' do
    setup do
      @dice = Dice::Base.new :example
    end
    should 'd100 returns a number 1-100' do
      assert_match( /([1-9]|[1-9][0-9]|100)/, @dice.d100.to_s)
    end
    should 'd20 returns a number 1-20' do
      assert_match( /([1-9]|1[0-9]|20)/, @dice.d20.to_s)
    end
  end
end
