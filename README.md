# Utf8AttributeSanitiser

Sanitise attributes to avoid invalid byte sequence argument errors

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'utf8_attribute_sanitiser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install utf8_attribute_sanitiser

## Usage

In your model add utf8_attribute_sanitiser, specyfing list of attribute names to sanitise

    class User < ActiveRecord::Base
      utf8_attribute_sanitiser :name, :address
    end

Default cleaning method is `utf8mb4only` and it only affects 4 byte characters

You can use aggressive clean method that strips out all invalud utf8 characters like

    class User < ActiveRecord::Base
      utf8_attribute_sanitiser :name, :address, method: :aggressive
    end

## Running tests

    $ rspec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomdracz/utf8_attribute_sanitiser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
