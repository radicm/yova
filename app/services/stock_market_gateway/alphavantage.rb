class StockMarketGateway
  class Alphavantage < Base
    BASE_URL = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY".freeze

    # @param [OpenStruct] config
    # @param [HttpClient] http_client
    def initialize(config, http_client)
      @config      = config
      @http_client = http_client

      super
    end

    # @param [String] company
    # @return [Array][Hash]
    def fetch(company, date_range = nil)
      options                 = { query_url: { symbol: company, apikey: @config.api_key } }
      body, _status, _headers = @http_client.get(BASE_URL, options)
      # NOTE: handle response errors

      data = format_response(body)
      date_range ? data.select { |value| date_range.between?(value[:date]) }.reverse : data
    end

    private

    # @param [String] raw_data
    # @return [Array][Hash]
    def format_response(raw_data)
      data = JSON.parse(raw_data)

      data["Time Series (Daily)"].inject([]) do |acc, (date, value)|
        acc << { date: date.to_date, value: value["4. close"].to_f }
      end
    end
  end

  ALPHAVANTAGE = StockMarketGateway::Alphavantage
end
