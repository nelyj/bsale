require 'spec_helper'

RSpec.describe Bsale::PriceList do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#new' do
    it 'returns an instance class' do
      price_list = described_class.new

      expect(price_list).to be_a_kind_of(described_class)
    end

    it 'returns an instance class with empty attributes' do
      price_list = described_class.new

      expect(price_list.href).to eq nil
      expect(price_list.id).to eq nil
      expect(price_list.name).to eq nil
      expect(price_list.state).to eq nil
      expect(price_list.coin).to eq nil
      expect(price_list.details).to eq nil
    end
  end

  context '#all' do
    it 'returns a list with instance classes' do
      price_list = described_class.new

      expect(price_list.all).to be_a_kind_of(Array)
    end

    it 'returns ID with the first object in list' do
      price_list = described_class.new

      expect(price_list.all.first.id).to eq '120'
    end
  end
end
