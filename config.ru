require 'bundler'
Bundler.require

$:.unshift File.expand_path(File.join("..","lib"), __FILE__)

require 'api'
require 'web'

run Rack::URLMap.new( { "/api" => Api, "/" => Web } )
