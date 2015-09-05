require 'minitest/autorun'
require 'shoulda/context'
require 'dice'

class TestDice < Minitest::Test
  context 'Dice rolls ...' do
    setup do
      @dice = Dice::Base.new :rolemaster
    end
    should 'd100 returns a number 1-100' do
      assert_match( /([1-9]|[1-9][0-9]|100)/, @dice.d100.to_s)
    end
  end
end
