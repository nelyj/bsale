require 'spec_helper'

RSpec.describe Bsale::Detail do
  context '#new' do
    it 'returns an intance class' do
      detail = described_class.new

      expect(detail).to be_a_kind_of(described_class)
    end

    it 'returns an instance with attributes' do
      detail = described_class.new(
        netUnitValue: 53_975,
        quantity: 1,
        taxId: '[1,2]',
        comment: 'el nombre del producto que voy a vender',
        discount: 5
      )

      expect(detail.netUnitValue).to eq 53_975
      expect(detail.quantity).to eq 1
      expect(detail.taxId).to eq '[1,2]'
      expect(detail.comment).to eq 'el nombre del producto que voy a vender'
      expect(detail.discount).to eq 5
    end
  end

  context '#find' do
    detail = described_class.new

    expect(detail.find(document_id: 9)).to be_a_kind_of(described_class)
  end
end
