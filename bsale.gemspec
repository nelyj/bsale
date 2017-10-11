# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bsale/version"

Gem::Specification.new do |spec|
  spec.name          = "bsale"
  spec.version       = Bsale::VERSION
  spec.authors       = ["Nelson Patricio Jimenez"]
  spec.email         = ["developer.jimenez@gmail.com"]

  spec.summary       = %q{Ruby Client Library for Bsale API}
  spec.description   = %q{Ruby Client Library for Bsale API}
  spec.homepage      = "https://github.com/gmontero/API-Bsale/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry-byebug"
  spec.add_dependency "faraday", '~> 0.9'
  spec.add_dependency "uri_template", '~> 0.7'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
