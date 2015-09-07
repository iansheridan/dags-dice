module Dice
  class Utility
    class << self
      def camelize(term, uppercase_first_letter = true)
        string = term.to_s
        if uppercase_first_letter
          string = string.sub(/^[a-z\d]*/) { $&.capitalize }
        else
          string = string.sub(/^((?=\b|[A-Z_])|\w)/) { $&.downcase }
        end
        string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
        string.gsub!(/\//, '::')
        string
      end
      def constantize(camel_cased_word)
        names = camel_cased_word.split('::')

        # Trigger a built-in NameError exception including the ill-formed constant in the message.
        Object.const_get(camel_cased_word) if names.empty?

        # Remove the first blank element in case of '::ClassName' notation.
        names.shift if names.size > 1 && names.first.empty?

        names.inject(Object) do |constant, name|
          if constant == Object
            constant.const_get(name)
          else
            candidate = constant.const_get(name)
            next candidate if constant.const_defined?(name, false)
            next candidate unless Object.const_defined?(name)

            # Go down the ancestors to check if it is owned directly. The check
            # stops when we reach Object or the end of ancestors tree.
            constant = constant.ancestors.inject do |const, ancestor|
              break const    if ancestor == Object
              break ancestor if ancestor.const_defined?(name, false)
              const
            end

            # owner is in Object, so raise
            constant.const_get(name, false)
          end
        end
      end
    end
  end
end
