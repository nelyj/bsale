require 'spec_helper'

RSpec.describe Bsale do
  before(:each) do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  it 'set credentials correctly' do
    expect(Bsale.config.access_token).to eq ENV['BSALE_KEY']
    expect(Bsale.config.content_type).to eq 'application/json'
  end

  it 'has a version number' do
    expect(Bsale::VERSION).not_to be '0.1.0'
  end
end
