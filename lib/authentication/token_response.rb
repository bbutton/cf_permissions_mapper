require 'json'

class TokenResponse
  attr_reader :access_token
  attr_reader :refresh_token
  attr_reader :token_type
  attr_reader :scope
  attr_reader :jti
  attr_reader :expires_in

  def self.from_json json
    content = JSON.parse(json)
    TokenResponse.new content["access_token"], content["refresh_token"], content["token_type"], content["scope"], content["jti"], content["expires_in"]
  end

  def initialize(access_token, refresh_token, token_type, scope, jti, expires_in)
    @access_token = access_token
    @refresh_token = refresh_token
    @token_type = token_type
    @scope = scope
    @jti = jti
    @expires_in = expires_in
  end
end