require 'test_helper'
require 'dice'

class TestDiceDie < Minitest::Test
  context 'Dice::Die module' do
    setup do
      @die = class Die; include Dice::Die; end.new
    end
    should 'have d100 returns a number 1-100' do
      assert_match( /([1-9]|[1-9][0-9]|100)/, @die.d100.to_s)
    end
    should 'have d20 returns a number 1-20' do
      assert_match( /([1-9]|1[0-9]|20)/, @die.d20.to_s)
    end
  end
end
