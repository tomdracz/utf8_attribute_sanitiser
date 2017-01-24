require "utf8_attribute_sanitiser/version"

module Utf8AttributeSanitiser
  def utf8_attribute_sanitiser(*attributes)
    attributes.each do |attribute|
      before_validation do |record|
        value = record[attribute]
        sanitised_value = value.respond_to?(:encode) ? value.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: "") : value
        record[attribute] = sanitised_value
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Utf8AttributeSanitiser) if defined? ActiveRecord
