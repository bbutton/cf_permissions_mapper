require_relative '../authentication/authenticator'
require_relative '../config/configuration'
require_relative '../authentication/token_response'

class CFGateway
  def initialize(configuration, authenticator)
    @configuration = configuration
    @authenticator = authenticator
  end

  def as(username, password)
    token_response = @authenticator.login(username, password)
    @current_access_token = token_response.access_token
    self
  end

  def do_get(path)
    headers = {"Authorization" => "Bearer #{@current_access_token}", "Host" => "api.10.244.0.34.xip.io", "Cookies" => ""}
    response = RestClient.get("api.10.244.0.34.xip.io" + path, headers)
  end
end