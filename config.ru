require 'bundle'
Bundle.setup

$:.unshift File.expand_path(File.join("..","lib"), __FILE__)

require 'api'
require 'web'

run Rack::Cascade.new [Api, Web]
