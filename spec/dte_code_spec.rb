require 'spec_helper'

RSpec.describe Bsale::DteCode do
  context '#new' do
    it 'returns an instance class' do
      dte_code = described_class.new

      expect(dte_code).to be_a_kind_of(described_class)
    end

    it 'returns an instance class with empty attributes' do
      dte_code = described_class.new

      expect(dte_code.href).to eq nil
      expect(dte_code.id).to eq nil
      expect(dte_code.name).to eq nil
      expect(dte_code.codeSii).to eq nil
      expect(dte_code.state).to eq nil
    end
  end
end
