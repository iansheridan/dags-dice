require 'minitest/autorun'
require 'shoulda/context'
require 'dice'

class TestDice < Minitest::Test
  def setup
    @dice = Dice.new
  end
end
