require "forwardable"

class HttpClient
  extend Forwardable

  def_delegators :@http_client, :get, :put, :post, :delete

  # @param [HttpClient::Object] client
  # @param [Hash] config
  def initialize(client = HttpClient::FARADAY, config = {})
    @http_client = client.new(config)
  end
end
