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
  end

  context '#all' do
  end

  context '#find' do
  end

  context '#create' do
  end

  context '#update' do
  end
end
