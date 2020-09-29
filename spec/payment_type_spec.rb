require 'spec_helper'

RSpec.describe Bsale::PaymentType do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#new' do
    it 'returns a class instance' do
      payment_type = described_class.new

      expect(payment_type).to be_a_kind_of(described_class)
    end

    it 'returns a class instance with empty attributes' do
      payment_type = described_class.new

      expect(payment_type.id).to eq nil
    end
  end

  context '#all' do
    it 'returns array with class instances' do
      payment_type = described_class.new
      all = payment_type.all

      expect(all).to be_a_kind_of(Array)
      expect(all.first).to be_a_kind_of(described_class)
    end
  end

  context '#find' do
    it 'returns an instance class with attributes' do
      payment_type = described_class.new

      expect(payment_type.find(id: 14).id).to eq(14)
    end
  end
end

