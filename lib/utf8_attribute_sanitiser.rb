require "utf8_attribute_sanitiser/version"

module Utf8AttributeSanitiser
  def utf8_attribute_sanitiser(*attributes, method: :utf8mb4only)
    attributes.each do |attribute|
      before_validation do |record|
        value = record[attribute]
        if method == :utf8mb4only
          sanitised_value = value.respond_to?(:encode) ? value.each_char.select{|c| c.bytes.count < 4 }.join('') : value
        elsif method == :aggressive
          sanitised_value = value.respond_to?(:gsub) ? value.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: "") : value
        end
        record[attribute] = sanitised_value
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Utf8AttributeSanitiser) if defined? ActiveRecord
