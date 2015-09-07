class String
  # +constantize+ tries to find a declared constant with the name specified
  # in the string. It raises a NameError when the name is not in CamelCase
  # or is not initialized.  See ActiveSupport::Inflector.constantize
  #
  #   'Module'.constantize  # => Module
  #   'Class'.constantize   # => Class
  #   'blargle'.constantize # => NameError: wrong constant name blargle
  def constantize
    Dice::Utility.constantize(self)
  end

  # By default, +camelize+ converts strings to UpperCamelCase. If the argument to camelize
  # is set to <tt>:lower</tt> then camelize produces lowerCamelCase.
  #
  # +camelize+ will also convert '/' to '::' which is useful for converting paths to namespaces.
  #
  #   'active_record'.camelize                # => "ActiveRecord"
  #   'active_record'.camelize(:lower)        # => "activeRecord"
  #   'active_record/errors'.camelize         # => "ActiveRecord::Errors"
  #   'active_record/errors'.camelize(:lower) # => "activeRecord::Errors"
  def camelize(first_letter = :upper)
    case first_letter
    when :upper
      Dice::Utility.camelize(self, true)
    when :lower
      Dice::Utility.camelize(self, false)
    end
  end
  alias_method :camelcase, :camelize

end
