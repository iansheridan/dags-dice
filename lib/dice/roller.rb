module Dice
  class Roller
    DEFAULT_TYPE=:rolemaster
    DEFAULT_DIE=:d100_open
    include Dice::Die
    attr_accessor :opts
    def initialize(given_opts={})
      @opts = Hashie::Mash.new(opts)
      @opts.type ||= DEFAULT_TYPE
      @opts.die ||= DEFAULT_DIE
      class << self; include "dice/types/#{DEFAULT_TYPE}".camelize.constantize; end
    end
    def roll
      send(@opts.die)
    end
  end
end
