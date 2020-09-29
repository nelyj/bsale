require 'spec_helper'

RSpec.describe Bsale::DocumentType do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#all' do
    it 'returns a list of instance classes' do
      document_type = Bsale::DocumentType.new

      expect(document_type.all).to be_a_kind_of(Array)
    end
  end

  context '#find' do
    it 'returns an instance class' do
      document_type = Bsale::DocumentType.new

      expect(document_type.find(id: 1)).to be_a_kind_of(described_class)
    end
  end
end
