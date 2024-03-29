require 'rspec'
require_relative '../../lib/authentication/authenticator'
require_relative '../../lib/config/configuration_reader'
require_relative '../../lib/config/configuration'
require_relative '../../lib/rest/cf_gateway'
require_relative '../../lib/commands/list_orgs'

describe 'List orgs' do

  it 'should list all orgs' do
    config_reader = ConfigurationReader.new('./spec/bosh_lite_config.json')
    config = config_reader.parse
    authenticator = Authenticator.new(config)

    cf_gateway = CFGateway.new(config, authenticator)

    list_orgs = ListOrgs.new(cf_gateway)
    result = list_orgs.execute('admin', 'admin')

    expect(result.code).to eq(200)
  end
end