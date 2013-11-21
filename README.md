# CrazyPills

You should never use CrazyPills in your application.

By requiring CrazyPills you are randomly removing and/or nil-ifying
a random method of one of many of the core classes of the Ruby
interpreter.  It is really a bad idea to use it.

## Installation

Add this line to your application's Gemfile:

    gem 'crazy_pills'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crazy_pills

## Usage

If you want to know which method got "crazy-fied" then just ask crazy pills

```ruby
  require 'crazy_pills'

  CrazyPills.explain
  # Made Object#is_a? just return nil
```

If you want to make it get realllllll crazy, just up the level of crazy

  HOW_CRAZY=10 bundle exec irb

```ruby
  require 'crazy_pills'

  CrazyPills.explain
  # Made Float#to_enum just return nil
  # Made String#capitalize just return nil
  # Made Exception#untrust just return nil
  # Aliased Float#coerce to Float#%
  # Aliased Exception#define_singleton_method to Exception#method
  # Aliased Hash#! to Hash#equal?
  # Aliased Object#<=> to Object#nil?
  # Aliased Object#taint to Object#gem
  # Aliased Exception#public_method to Exception#class
  # Aliased Exception#!= to Exception#protected_methods
```

And if you need to debug, then just pass a DEBUG flag

  DEBUG=1 HOW_CRAZY=10 bundle exec irb

```ruby
  require 'crazy_pills'

  # Nil-ify Exception#trust
  # Aliased ["File#to_a", "File#grep"]
  # Aliased ["String#chop!", "String#object_id"]
  # Aliased ["Numeric#__send__", "Numeric#remove_instance_variable"]
  # Nil-ify Hash#!
  # Nil-ify File#methods
  # Nil-ify Float#gem
  # Nil-ify Object#define_singleton_method
  # Nil-ify Numeric#zero?
  # Nil-ify Exception#__id__
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
