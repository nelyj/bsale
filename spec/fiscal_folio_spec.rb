require 'spec_helper'

RSpec.describe Bsale::FiscalFolio do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#availables_by' do
    it 'returns an instance class' do
      fiscal_folio = described_class.new
      response = fiscal_folio.availables_by(codesii: 33)

      expect(response).to be_a_kind_of(described_class)
      expect(response.numbers_available).to be_a_kind_of(Integer)
      expect(response.last).to be_a_kind_of(Integer)
    end
  end
end
