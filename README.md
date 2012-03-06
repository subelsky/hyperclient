# Hyperclient

This gem aims to explore and demonstrate how to write a client for [hypermedia APIs](http://blog.steveklabnik.com/posts/2012-02-23-rest-is-over), formerly
known as REST interfaces that respect the [HATEOAS constraint](http://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven).

Many people have demonstrated how the server should respond. I'm investigating how the client should behave when interacting with a true hypermedia server.

The gem is being developed against the [Hypertext Application Language](http://stateless.co/hal_specification.html) and [Atompub](http://bitworking.org/projects/atom/rfc5023.html) specifications.

Contributors welcome!

## Installation

Add this line to your application's Gemfile:

    gem 'hyperclient'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hyperclient

## Usage

```ruby
require 'hyperclient'

# NOTE this is the only URI you ever need to specify yourself. The server will provide all future links.
resource = Hyperclient::Resource.new("http://api.example.com")

resource.links.each { |l| puts(l.relation => l.uri) }
# {:self => "https://api.example.com"}
# {:orders => "https://api.example.com/orders"}
# {:customers => "https://api.example.com/customers"}

# since we're at the root level of this API we haven't drilled into any objects yet
pp resource.objects
# []

orders_resource = resource[:orders].get
pp orders_resource.links
# {:self => "https://api.example.com/orders",
#  :next => "https://api.example.com/orders/page/2"}

pp orders_resource.objects
# [{:id => 50, :item_name => "R2 Motivator"},
   {:id => 51, :item_name => "Hydrospanner"}]

order_resource = orders_resource.post({ item_name: "Droid Coolant" })
pp order_resource.location
# "https://api.example.com/orders/52"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Questions?

Contact me on [Twitter](https://twitter/subelsky) or [email](mike@subelsky.com).
