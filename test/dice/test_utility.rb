require 'test_helper'
require 'dice'

class TestDiceUtility < Minitest::Test
  context 'Dice::Utility' do
    context '#camelize' do
      should 'return a Camel Cased string' do
        assert_equal( "TestCamelCase", Dice::Utility.camelize('test_camel_case') )
      end
      should 'return a ruby heredital object string' do
        assert_equal( "Test::Camel::Case", Dice::Utility.camelize('test/camel/case') )
      end
    end
    context '#constantize' do
      should 'return an object' do
        assert_equal( Dice::Utility, Dice::Utility.constantize('Dice::Utility') )
      end
    end
  end
end
