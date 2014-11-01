require 'rspec'
require 'json'
require_relative '../../lib/authentication/token_response'

describe 'Reads from JSON' do

  it 'should create new object' do
    json = '{ "access_token": "AT", "token_type": "TT", "refresh_token": "RT", "scope": "s1, s2, s3", "jti" : "JTI", "expires_in" : 1000 }'

    token_response = TokenResponse.from_json(json)

    expect(token_response.access_token).to eq("AT")
    expect(token_response.refresh_token).to eq("RT")
    expect(token_response.token_type).to eq("TT")
    expect(token_response.scope).to eq("s1, s2, s3")
    expect(token_response.jti).to eq("JTI")
    expect(token_response.expires_in).to eq(1000)
  end
end