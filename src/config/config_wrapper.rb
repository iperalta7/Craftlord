require_relative 'config'

module CraftminConfig
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
