require "bundler/setup"
require "bsale"

ENV['BSALE_KEY'] = '5ba1dae4470f8eda4998957a8210db81aae62f83'
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
