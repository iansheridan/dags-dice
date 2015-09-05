module Dice
  class Base
    def initialize(type)

    end
    def d100
      roll = "#{rand(10)}#{rand(10)}".to_i
      100 if roll == 0
      roll
    end
  end
end
