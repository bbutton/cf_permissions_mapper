require "rest-client"
require 'base64'
require_relative '../authentication/token_response'

class Authenticator
  def initialize configuration_reader
    configuration_reader = configuration_reader
    @configuration = configuration_reader.parse
  end

  def login username, password
    payload_data = {
        "grant_type" => "password",
        "scope" => "",
        "username" => username,
        "password" => password
    }
    payload = payload_data.map{ |k,v| "#{k}=#{v}" }.join('&')
    auth_data = Base64.strict_encode64("#{@configuration.client_name}:#{@configuration.client_secret}")
    path = @configuration.uaa_endpoint + "/oauth/token"

    headers = { "Accept" => "application/json", "Content-Type" => "application/x-www-form-urlencoded", "Authorization" => "Basic #{auth_data}" }

    response = RestClient.post(path, URI.encode(payload), headers)
    TokenResponse.from_json(response)
  end
end