$:.unshift File.expand_path(File.join("..","..","lib"), __FILE__)
require 'dice'
require 'grape'
require 'pry'

class Api < Grape::API
  version 'v1', using: :path
  format :json
  get '/' do
    {
      endpoints: [
        {
          name: "d100",
          url: "/#{version}/roll/d100"
        }
      ]
    }
  end
  get '/roll/default' do
    {
      roll: Dice::Roller.new.roll
    }
  end
end
