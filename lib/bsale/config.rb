module ShipitAPI
  class Config
    attr_accessor :access_token, :content_type, :version

    def initialize
      @content_type ||= 'application/json'.freeze
      @version ||= '1'.freeze
    end
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure(&block)
    yield(config) if block_given?
  end
end
