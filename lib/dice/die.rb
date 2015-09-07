module Dice
  module Die

    module ClassMethods

    end

    module InstanceMethods
      def d100
        roll = "#{rand(10)}#{rand(10)}".to_i
        return 100 if roll == 0
        roll
      end
      def d20
        rand(19)+1
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

  end
end
