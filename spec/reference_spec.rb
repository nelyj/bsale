require 'spec_helper'

RSpec.describe Bsale::Reference do
  context '#new' do
    it 'returns an instance class' do
      reference = described_class.new

      expect(reference).to be_a_kind_of(described_class)
    end

    it 'returns an instance class with attributes' do
      reference = described_class.new(
        number: 123,
        referenceDate: 1407715200,
        reason: 'Orden de Compra 123',
        codeSii: 801
      )
    end
  end
end
