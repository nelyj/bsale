require "spec_helper"

RSpec.describe Bsale do
  before(:each) do
    Bsale.configure do |config|
      config.access_token = '1b39dfc11de21a39c248c0af23a66a868c4d9341'
    end
  end

  it 'set credentials correctly' do
      expect(Bsale.config.access_token).to eq '1b39dfc11de21a39c248c0af23a66a868c4d9341'
      expect(Bsale.config.content_type).to eq 'application/json'
    end

  it "has a version number" do
    expect(Bsale::VERSION).not_to be "0.1.0"
  end

  context "When is a document" do
    before(:each) do
      @document = Bsale::Document.new
    end

    it "get all documents" do
      response = @document.all
      expect(response["href"].include?("documents")).to eq true
    end

    it "get a summary" do
      response = @document.summary
      expect(response.class).to eq Array
    end
  end
end
