class StockMarketGateway
  class Base
    # @param [OpenStruct] config
    def initialize(config = {}, http_client = HttpClient.new) end

    def fetch
      raise "Override method"
    end
  end
end
