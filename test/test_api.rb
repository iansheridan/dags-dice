require 'test_helper'
require 'api'
require 'pry'

class TestApi < Minitest::Test
  include Rack::Test::Methods
  def app
    Api
  end
  context 'Api' do
    should '' do
      get "/v1/"
      # assert_equal( /[0-9]+/, @dice.roll.to_s )
      assert last_response.ok?
    end
  end
end
