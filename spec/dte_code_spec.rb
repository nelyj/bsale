require 'spec_helper'

RSpec.describe Bsale::DteCode do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

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

  context '#all' do
    it 'returns a list of instance classes' do
      dte_code = described_class.new

      expect(dte_code.all).to be_a_kind_of(Array)
    end

    it 'returns a list with DteCode instance class' do
      dte_code = described_class.new

      expect(dte_code.all.first).to be_a_kind_of(described_class)
    end
  end

  context '#find' do
    it 'returns an instance class when it passes an ID' do
      dte_code = described_class.new

      expect(dte_code.find(id: 8)).to be_a_kind_of(described_class)
    end
  end
end
