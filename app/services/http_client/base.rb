class HttpClient
  class Base
    def initialize(_config = {}) end

    # @param [String] _url
    # @param [Hash] _options { headers: {}, query__url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def get(_url, _options)
      raise "Override method!"
    end

    # @param [String] _url
    # @param [Hash] _options { headers: {}, query__url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def post(_url, _options)
      raise "Override method!"
    end

    # @param [String] _url
    # @param [Hash] _options { headers: {}, query__url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def put(_url, _options)
      raise "Override method!"
    end

    # @param [String] _url
    # @param [Hash] _options { headers: {}, query__url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def delete(_url, _options)
      raise "Override method!"
    end

    class Response < Struct.new(:body, :status, :headers); end
  end
end
