# Usage:
# class Person
#   validates :email, email: true
# end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # other regex: /\A[^@]+@[^@]+\z/
    record.errors[attribute] << (options[:message] || 'is not a valid email') unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end