require 'test_helper'
require 'dice'

class TestDiceRoller < Minitest::Test
  context 'Dice rolls' do
    setup do
      @dice = Dice::Roller.new
    end
    should 'default settings rolls a number' do
      assert_match( /[0-9]+/, @dice.roll.to_s )
    end
  end
end
