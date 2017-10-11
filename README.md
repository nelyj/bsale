# Bsale

Unofficial Ruby client for the [BSale API](https://github.com/gmontero/API-Bsale/wiki)

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

## Example to create document

```ruby
# create document

tax = Bsale::Tax.new
payments = Bsale::Payment.new({ paymentTypeId: nil, amount: nil, recordDate: nil })
client = Bsale::Client.new({ code: "1-9", city: "Santiago",
                             company: "Freelance SpA", municipality: "Santiago Centro",
                             activity: "Asesoría informatica", address: "Moneda 975" })
taxes = tax.all["items"].map {|item| item["id"] }

details = Bsale::Detail.new({ netUnitValue: 53975, quantity: 1,
                              taxId: "#{taxes}", comment: "el nombre del producto que voy a vender", discount: 5 })
reference = Bsale::Reference.new({ number: 123, referenceDate: Time.now.to_i,
                                   reason: "Factura electrónica 123", codeSii: 33 })

document = Bsale::Document.new({ codeSii: 33, emissionDate: Time.now.to_i,
                                 expirationDate: Time.now.to_i, declareSii: 0,
                                   client: client.to_h})
document.details << details.to_h
document.references << reference.to_h

request = document.create(document.to_h)

#request return with a Hash like this:

{"href"=>"https://api.bsale.cl/v1/documents/2014.json",
 "id"=>2014,
 "emissionDate"=>1507680000,
 "expirationDate"=>1507680000,
 "generationDate"=>1507748801,
 "number"=>67,
 "totalAmount"=>61018.0,
 "netAmount"=>51276.0,
 "taxAmount"=>9742.0,
 "exemptAmount"=>0.0,
 "exportTotalAmount"=>0.0,
 "exportNetAmount"=>0.0,
 "exportTaxAmount"=>0.0,
 "exportExemptAmount"=>0.0,
 "commissionRate"=>0.0,
 "commissionNetAmount"=>0.0,
 "commissionTaxAmount"=>0.0,
 "commissionTotalAmount"=>0.0,
 "percentageTaxWithheld"=>0.0,
 "purchaseTaxAmount"=>0.0,
 "purchaseTotalAmount"=>0.0,
 "address"=>"Moneda 975",
 "municipality"=>"Santiago Centro",
 "city"=>"Santiago",
 "urlTimbre"=>nil,
 "ted"=>nil,
 "urlPublicView"=>"http://app2.bsale.cl/view/9970/f3b890392f70?sfd=99",
 "urlPdf"=>"http://app2.bsale.cl/view/9970/f3b890392f70.pdf?sfd=99",
 "urlPublicViewOriginal"=>"http://app2.bsale.cl/view/9970/f3b890392f70",
 "urlPdfOriginal"=>"http://app2.bsale.cl/view/9970/f3b890392f70.pdf",
 "token"=>"f3b890392f70",
 "state"=>0,
 "urlXml"=>nil,
 "informedSii"=>2,
 "responseMsgSii"=>nil,
 "document_type"=>{"href"=>"https://api.bsale.cl/v1/document_types/5.json", "id"=>"5"},
 "client"=>{"href"=>"https://api.bsale.cl/v1/clients/110.json", "id"=>"110"},
 "office"=>{"href"=>"https://api.bsale.cl/v1/offices/1.json", "id"=>"1"},
 "user"=>{"href"=>"https://api.bsale.cl/v1/users/3.json", "id"=>"3"},
 "coin"=>{"href"=>"https://api.bsale.cl/v1/coins/1.json", "id"=>"1"},
 "references"=>{"href"=>"https://api.bsale.cl/v1/documents/2014/references.json"},
 "document_taxes"=>{"href"=>"https://api.bsale.cl/v1/documents/2014/document_taxes.json"},
 "details"=>{"href"=>"https://api.bsale.cl/v1/documents/2014/details.json"},
 "sellers"=>{"href"=>"https://api.bsale.cl/v1/documents/2014/sellers.json"}}

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
