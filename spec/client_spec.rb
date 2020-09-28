require 'spec_helper'

RSpec.describe Bsale::Client do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#new' do
    subject { described_class.new }

    it 'returns an class instance' do
      is_expected.to be_a_kind_of(described_class)
    end

    it 'returns an class instance with attributes' do
      response = described_class.new(code: 'foo')

      expect(response).to be_a_kind_of(described_class)
      expect(response.code).to eq 'foo'
    end

    it 'raises an error with bad attributes' do
      expect { raise described_class.new(foo: 'bar') }.to raise_error(Bsale::UndefinedAttributes)
    end
  end

  context '#all' do
    it 'returns a list of clients' do
      client = Bsale::Client.new
      expect(client.all).to be_a_kind_of(Array)
    end
  end

  context '#find' do
    it 'returns a client instance' do
      client = Bsale::Client.new
      expect(client.find(16)).to eq client.id
    end
  end

  context '#create' do
    it 'create a client' do
      client = Bsale::Client.new(
        municipality: 'Las Condes',
        phone: '66287196',
        activity: 'Venta de ropa',
        city: 'Santiago',
        maxCredit: 100000,
        hasCredit: 1,
        accumulatePoints: 1,
        lastName: 'Muñoz',
        note: 'Cliente premiun',
        firstName: 'Marcela',
        company: 'Particular',
        address: 'Los trigales 372',
        email: 'mmunoz@.email.cl',
        code: '2-7'
      )
      expect(client.create).to be_a_kind_of(Bsale::Client)
    end
  end

  context '#create_address' do
  end

  context '#update_address' do
  end

  context '#count' do
  end

  context '#purchases_by' do
  end
end
