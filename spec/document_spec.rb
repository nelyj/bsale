require 'spec_helper'

RSpec.describe Bsale::Document do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#all' do
    it 'returns a list of documents' do
      document = Bsale::Document.new
      expect(document.all).to be_a_kind_of(Array)
    end
  end

  context '#find' do
    it 'returns an instance class' do
      document = Bsale::Document.new
      expect(document.find(1)).to eq document.id
    end
  end

  context '#create' do
    it 'returns a new document object' do
      payment = Bsale::Payment.new
      taxe = Bsale::Tax.new
      client = Bsale::Client.new
      reference = Bsale::Reference.new
      document = Bsale::Document.new(
        documentTypeId: 8,
        officeId: 1,
        emissionDate: 1407715200,
        expirationDate: 1407715200,
        declareSii: 0,
        priceListId: 18,
        client: client,
        details: [detail],
        payments: [payment],
        reference: reference,
      )

      binding.pry
      expect(document.create).to eq be_a_kind_of(Bsale::Document)
    end
  end
end
