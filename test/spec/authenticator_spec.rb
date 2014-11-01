require 'rspec'
require 'rest_client'
require 'json'

require_relative '../../lib/config/configuration_reader'
require_relative '../../lib/config/configuration'
require_relative '../../lib/authentication/authenticator'
require_relative '../../lib/authentication/authenticated_user'

describe 'Authenticates' do
  it 'returns the bearer token for the given username/password' do
    config_reader = ConfigurationReader.new './spec/bosh_lite_config.json'
    authenticator = Authenticator.new config_reader
    token_response = authenticator.login "admin", "admin"

    expect(token_response.access_token).not_to be_nil
    expect(token_response.refresh_token).not_to be_nil
  end
end