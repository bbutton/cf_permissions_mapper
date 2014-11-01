require "rest-client"
require 'base64'
require_relative '../authentication/token_response'
require_relative '../authentication/authenticated_user'
require_relative '../rest/cf_rest_client'

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
    auth_data = Base64.strict_encode64("cf:")
    path = @configuration.uaa_endpoint + "/oauth/token"

    headers = { "Accept" => "application/json", "Content-Type" => "application/x-www-form-urlencoded", "Authorization" => "Basic #{auth_data}" }

    response = RestClient.post(path, URI.encode(payload), headers)
    TokenResponse.from_json(response)
  end



  def get_user_token authenticated_user
    token_response = get_client_token

    payload_data = {
        'username' => "admin",
        'response_type' => "token",
        "state" => "needtogeneratestate",
        "source" => "login",
        "scope" => "",
        "client_id" => "cf",
        "redirect_uri" => "#{@configuration.uaa_endpoint}/oauth/token"
    }
    payload = payload_data.map{ |k,v| "#{k}=#{v}" }.join('&')

    endpoint_path = @configuration.uaa_endpoint + "/oauth/authorize"
    request_data = URI.encode(payload)
    header_hash = {'Accept' => 'application/json', 'Authorization' => "Bearer #{token_response.access_token}", 'Content-Type' => 'application/x-www-form-urlencoded'}

    rest_client = CFRestClient.new
    response = rest_client.post(endpoint_path, request_data, header_hash)
  end

  def get_client_token
    payload_data = { 'grant_type' => 'client_credentials' }
    payload = payload_data.map{ |k,v| "#{k}=#{v}" }.join('&')

    auth_string = "Basic #{Base64.encode64(@configuration.client_user_name + ":" + @configuration.client_secret)}".chomp
    post_data = URI.encode(payload)

    headers = {'Content-Type' => 'application/x-www-form-urlencoded', "Authorization" => auth_string, 'Accept' => 'application/json'}
    result_json = RestClient.post(@configuration.uaa_endpoint + '/oauth/token', post_data, headers)

    TokenResponse.from_json result_json
  end
end