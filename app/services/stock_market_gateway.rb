class StockMarketGateway
  extend Forwardable

  def_delegators :@gateway, :fetch

  # @param [StockMarketGateway::Object] gateway
  # @param [OpenStruct] config
  # @param [HttpClient::Object] http_client
  def initialize(gateway = ALPHAVANTAGE,
                 config = Settings.config.stock_market_gateway.alphavandage,
                 http_client = HttpClient.new)
    @gateway = gateway.new(config, http_client)
  end
end
