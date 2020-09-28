require 'spec_helper'

RSpec.describe Bsale::Payment do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#new' do
    it 'returns a class instance' do
      payment = described_class.new

      expect(payment).to be_a_kind_of(described_class)
    end

    it 'return a class instance with empty attributes' do
      payment = described_class.new

      expect(payment.paymentTypeId).to eq nil
      expect(payment.amount).to eq nil
      expect(payment.recordDate).to eq nil
    end

    it 'returns a class instance with attributes' do
      payment = described_class.new(
        paymentTypeId: 1,
        amount: 70_000,
        recordDate: 1_407_715_200
      )

      expect(payment.paymentTypeId).to eq 1
      expect(payment.amount).to eq(70_000)
      expect(payment.recordDate).to eq(1_407_715_200)
    end
  end
end
