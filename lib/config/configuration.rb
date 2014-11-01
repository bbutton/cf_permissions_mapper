class Configuration
  attr_reader :uaa_endpoint
  attr_reader :client_name
  attr_reader :client_secret
  attr_reader :use_ssl

  def initialize uaa_endpoint, client_user_name, client_secret, use_ssl
    @uaa_endpoint = uaa_endpoint
    @client_name = client_user_name
    @client_secret = client_secret
    @use_ssl = use_ssl
  end
end