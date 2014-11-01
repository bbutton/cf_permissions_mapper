require 'rspec'
require_relative '../../lib/config/configuration_reader'
require_relative '../../lib/config/configuration'

describe 'Reading config file' do

  it 'should read and parse json' do
    config_reader = ConfigurationReader.new './spec/test_config.json'
    configuration = config_reader.parse

    expect(configuration.uaa_endpoint).to eq("https://uaa_endpoint")
    expect(configuration.client_name).to eq("admin_user")
    expect(configuration.client_secret).to eq("client_secret")
    expect(configuration.use_ssl).to eq(true)
  end
end