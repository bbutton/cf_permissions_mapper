require 'rest-client'

class CFRestClient
  def initialize

  end

  def post path, request_data, header_hash
    RestClient.post(path, request_data, header_hash) {
        |response, request, result, &block| puts response
    }

  end
end