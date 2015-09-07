$:.unshift File.expand_path(File.join("..","..","lib"), __FILE__)
require 'dice'

class Api < Grape::API
  version 'v1', using: :path
  format :json
  get '/' do
    {
      roll: 
    }
  end
end
