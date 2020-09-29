require 'spec_helper'

RSpec.describe Bsale::Office do
  before do
    Bsale.configure do |config|
      config.access_token = ENV['BSALE_KEY']
    end
  end

  context '#new' do
    it 'returns an instance class' do
      office = Bsale::Office.new

      expect(office).to be_a_kind_of(described_class)
    end

    it 'returns an instance class with empty attributes' do
      office = Bsale::Office.new

      expect(office.href).to eq nil
      expect(office.id).to eq nil
      expect(office.name).to eq nil
      expect(office.description).to eq nil
      expect(office.address).to eq nil
      expect(office.latitude).to eq nil
      expect(office.longitude).to eq nil
      expect(office.isVirtual).to eq nil
      expect(office.country).to eq nil
      expect(office.municipality).to eq nil
      expect(office.city).to eq nil
      expect(office.zipCode).to eq nil
      expect(office.costCenter).to eq nil
      expect(office.state).to eq nil
      expect(office.imagestionCellarId).to eq nil
    end

    it 'returns an instance class with attributes' do
      office = Bsale::Office.new(
        longitude: '',
        zipCode: '000_000',
        name: 'Imaginex',
        latitude: '',
        isVirtual: 0,
        address: 'Santa Rosa 402',
        country: 'Chile',
        municipality: 'Puerto Varas',
        city: 'Puerto Varas',
        costCenter: '25',
        description: 'Oficina'
      )

      expect(office.latitude).to eq ''
      expect(office.zipCode).to eq '000_000'
      expect(office.name).to eq 'Imaginex'
      expect(office.latitude).to eq ''
      expect(office.isVirtual).to eq 0
      expect(office.address).to eq 'Santa Rosa 402'
      expect(office.country).to eq 'Chile'
      expect(office.municipality).to eq 'Puerto Varas'
      expect(office.city).to eq 'Puerto Varas'
      expect(office.costCenter).to eq '25'
      expect(office.description).to eq 'Oficina'
    end
  end

  context '#all' do
    it 'returns a list of offices' do
      office = Bsale::Office.new

      expect(office.all).to be_a_kind_of(Array)
    end
  end

  context '#find' do
    it 'returns an instance class' do
      office = Bsale::Office.new

      expect(office.find(id: 1)).to be_a_kind_of(described_class)
    end
  end

  context '#create' do
    it 'creates a new instance class' do
      office = Bsale::Office.new(
        longitude: '',
        zipCode: '000_000',
        name: 'Imaginex',
        latitude: '',
        isVirtual: 0,
        address: 'Santa Rosa 402',
        country: 'Chile',
        municipality: 'Puerto Varas',
        city: 'Puerto Varas',
        costCenter: '25',
        description: 'Oficina'
      )

      response = office.create

      expect(response).to be_a_kind_of(described_class)
      expect(response.id).to be_a_kind_of(Integer)
    end
  end

  context '#update' do
    it 'returns an updated object' do
      office = described_class.new.all.first
      office.description = 'Office Updated'
      expect(office.update.description).to eq 'Office Updated'
    end
  end
end
