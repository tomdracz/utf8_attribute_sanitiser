class MockModel
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  extend Utf8AttributeSanitiser

  attr_accessor :name, :age
  utf8_attribute_sanitiser :name, :age

  def []=(key, val)
    instance_variable_set(:"@#{key}", val)
  end

  def [](key)
    instance_variable_get(:"@#{key}")
  end
end

class AggressiveCleanMockModel < MockModel
  utf8_attribute_sanitiser :name, :age, method: :aggressive
end
