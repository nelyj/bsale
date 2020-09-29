require 'spec_helper'

RSpec.describe Bsale::Tax do
  before(:each) do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#all' do
    it 'returns an Array of taxes' do
      tax = described_class.new

      expect(tax.all).to be_a_kind_of(Array)
    end
  end

  context '#find' do
    let(:id) { 16 }

    it 'returns a class instance' do
      tax = described_class.new

      expect(tax.find(id: id)).to be_a_kind_of(described_class)
      expect(tax.find(id: id).id).to eq id
    end
  end
end
