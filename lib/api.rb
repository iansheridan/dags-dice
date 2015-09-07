$:.unshift File.expand_path(File.join("..","..","lib"), __FILE__)
require 'dice'
require 'grape'

class Api < Grape::API
  version 'v1', using: :path
  format :json
  get '/' do
    {
      roll: Dice::Roller.new.roll
    }
  end
end
