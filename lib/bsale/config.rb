module Bsale
  class Config
    attr_accessor :access_token, :content_type, :version, :extension, :headers

    def initialize
      @extension = ".json".freeze
      @content_type ||= 'application/json'.freeze
      @version ||= '1'.freeze
    end

    def headers
      { 'access_token' => @access_token, 'Content-Type' => @content_type }
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure(&block)
    yield(config) if block_given?
  end
end
