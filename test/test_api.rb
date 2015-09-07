require 'test_helper'
require 'api'
require 'pry'

class TestApi < Minitest::Test
  include Rack::Test::Methods
  def app
    Api
  end
  context 'Api Version 1' do
    should 'return a 200 response for root url' do
      get "/v1/"
      assert last_response.ok?
    end
    should 'return links to endpoints from root' do
      get "/v1/"
      expected = {
        "endpoints" => [
          {
            "name" => "d100",
            "url" => "/v1/roll/d100"
          }
        ]
      }
      assert_equal( JSON.parse(last_response.body), expected )
    end
  end
end
