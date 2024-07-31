require 'dotenv'
require_relative '../../config/config'

describe CraftminConfig::Configuration do

  let (:config) { CraftminConfig::Configuration.new }

  context 'when initialized' do

    it 'loads the environment variables' do
      expect(Dotenv).to receive(:load).with('config.env')
      config
    end

    it 'fetches the token from ENV' do
      allow(ENV).to receive(:fetch).with('DISCORD_BOT_TOKEN').and_return('test_token')
      expect(config.token).to eq('test_token')
    end

    it 'throws an error if the token is not set' do
      allow(ENV).to receive(:fetch).with('DISCORD_BOT_TOKEN').and_raise(KeyError)
      expect { config.token }.to raise_error(KeyError)
    end

    it 'sets the default prefix to "!"' do
      expect(config.prefix).to eq('!')
    end
  end

  context 'when modifying values' do
    it 'allows modifying the token' do
      config.token = 'new_token'
      expect(config.token).to eq('new_token')
    end

    it 'allows modifying the prefix' do
      config.prefix = '?'
      expect(config.prefix).to eq('?')
    end
  end
end