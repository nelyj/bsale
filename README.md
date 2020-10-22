# Bsale

Unofficial Ruby client for the [BSale API](https://apichile.bsalelab.com/lista-de-endpoints/documentos)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bsale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bsale

## Usage
### Configure with you app's credentials
Create a file into `config/initializer/bsale.rb` and put this:

```ruby
Bsale.configure do |config|
  config.access_token = ENV['BSALE_ACCESS_TOKEN']
end
```


```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Bug reports and pull requests are welcome on GitHub at https://github.com//bsale. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bsale project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nelyj/bsale/blob/master/CODE_OF_CONDUCT.md).
