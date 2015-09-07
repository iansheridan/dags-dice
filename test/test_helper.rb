# encoding: utf-8

$:.unshift File.expand_path(File.join("..","..","lib"), __FILE__)

require 'minitest/autorun'
require 'minitest/reporters'
require 'shoulda/context'
require 'rack/test'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
