require 'spec_helper'

RSpec.describe Bsale::Caf do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#where' do
    it 'returns a document list from Bsale' do
      caf = described_class.new
      response = caf.where(codesii: 33)

      expect(response).to be_a_kind_of(described_class)
      expect(response.startDate).to be_a_kind_of(Integer)
      expect(response.expirationDate).to be_a_kind_of(Integer)
      expect(response.startNumber).to be_a_kind_of(Integer)
      expect(response.endNumber).to be_a_kind_of(Integer)
      expect(response.lastNumberUsed).to be_a_kind_of(Integer)
      expect(response.numbersAvailable).to be_a_kind_of(Integer)
      expect(response.expired).to be_a_kind_of(Boolean)
    end

    it 'returns an error when it doesnt have caf availables' do
      caf = described_class.new
      response = caf.where(codesii: 33)

      expect(response.error).to be_a_kind_of(String)
      expect(response.error).to eql 'does not have numbers available, check sii caf'
    end
  end
end

