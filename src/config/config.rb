require 'dotenv'

module CraftminConfig
    class Configuration

    def initialize
      Dotenv.load('config.env')
    end
    
    attr_accessor :token, :prefix

    def token
      @token ||= ENV.fetch('DISCORD_BOT_TOKEN')
    end

    def prefix(prefix="!")
      @prefix ||= prefix
    end

    def server_dir
      @server_dir ||= ENV.fetch('SERVER_INSTALLATION_DIR')
    end
  end
end