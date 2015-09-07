require 'test_helper'
require 'dice'

class TestDice < Minitest::Test
  context 'Dice rolls' do
    setup do
      @dice = Dice::Roller.new
    end
    should 'd100 returns a number 1-100' do
      @dice.opts.die = :d100
      assert_match( /([1-9]|[1-9][0-9]|100)/, @dice.roll.to_s)
    end
    should 'd20 returns a number 1-20' do
      @dice.opts.die = :d20
      assert_match( /([1-9]|1[0-9]|20)/, @dice.roll.to_s)
    end
    should 'default settings rolls a number' do
      assert_match( /[0-9]+/, @dice.roll.to_s )
    end
  end
end
