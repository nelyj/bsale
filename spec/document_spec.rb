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

  context '#where' do
    it 'returns a list of documents filter by clientcode' do
      document = Bsale::Document.new
      expect(document.where(limit: 10)).to be_a_kind_of(Array)
    end
  end

  context '#count_all' do
    it 'returns total of documents' do
      document = Bsale::Document.new

      expect(document.count_all).to be_a_kind_of(Integer)
    end
  end

  context '#find' do
    it 'returns an instance class' do
      document = Bsale::Document.new
      expect(document.find(id: 1)).to eq 1
    end
  end

  context '#create' do
    it 'returns a new document object' do
      tax = Bsale::Tax.new
      document_type = Bsale::DocumentType.new
      office = Bsale::Office.new
      price_list = Bsale::PriceList.new

      # it should use codeSii instead of documentTypeId
      document_type = document_type.all.find { |dt| dt.codeSii == '33' }
      office = office.all.first
      # default price list
      emission_date = Time.now.to_i
      expiration_date = emission_date + (86_400 * 2)
      declare_sii = 1 #true

      # para boleta no es necesario el cliente, para la factura el cliente es necesario
      # si manejas el stock en bsale se envia el detalle del documento
      tax = tax.all.find {|t| t.name == 'IVA' }
      # solo llenaremos el detail para declarar en sii
      detail = Bsale::Detail.new(
        netUnitValue: 59_975,
        quantity: 1,
        taxId: "[#{tax.id}]",
        comment: 'Pago de cuota',
        discount: 0
      )

      client = Bsale::Client.new(
        code: '1-9',
        city: 'Puerto Varas',
        company: 'Nombre Ejemplo',
        municipality: 'Comuna',
        activity: 'Giro',
        address: 'Dirección',
        email: 'fake@fake.com',
        isForeigner: 0,
        companyOrPerson: 1
      )

      price_list = price_list.all.first

      document = Bsale::Document.new(
        priceListId: price_list.id,
        documentTypeId: document_type.id,
        officeId: office.id,
        emissionDate: emission_date,
        expirationDate: expiration_date,
        declareSii: declare_sii,
        details: [detail],
        client: client
      )

      expect(document.create).to be_a_kind_of(Bsale::Document)
    end
  end
end
