module Dice
  module Types
    module Rolemaster
      module ClassMethods
        #
      end

      module InstanceMethods
        def d100_open roll=0
          current_roll = d100
          if current_roll > 95
            output = roll + d100_open( current_roll )
          elsif current_roll < 5
            output = roll - d100_open( current_roll )
          else
            output = roll + current_roll
          end
          output
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end
