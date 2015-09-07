require 'test_helper'
require 'dice/types'

class TestRolemasterHigh
  include Dice::Types::Rolemaster
  @@first = true
  def d100
    o = 47
    o = 100 if @@first
    @@first = false
    o
  end
end

class TestRolemasterLow
  include Dice::Types::Rolemaster
  @@first = true
  def d100
    o = 47
    o = 4 if @@first
    @@first = false
    o
  end
end

class TestDiceTypesRolemaster < Minitest::Test
  context 'High Dice rolls' do
    should 'produce an positive open ended roll' do
      assert_operator( TestRolemasterHigh.new.d100_open, :>, 100 )
    end
    should 'produce an negative open ended roll' do
      assert_operator( TestRolemasterLow.new.d100_open, :<, 0 )
    end
  end
end
