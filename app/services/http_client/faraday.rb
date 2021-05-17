require "faraday"
require "json"

class HttpClient
  class Faraday < Base
    def initialize(_config = {})
      @connection = ::Faraday.new

      super
    end

    # @param [String] url
    # @param [Hash] options { headers: {}, query_url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def get(url, options)
      response = @connection.get(url, &build_request(options))
      [response.body, response.status, response.headers]
    end

    # @param [String] url
    # @param [Hash] options { headers: {}, query_url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def post(url, options)
      response = @connection.post(url, &build_request(options))
      [response.body, response.status, response.headers]
    end

    # @param [String] url
    # @param [Hash] options { headers: {}, query_url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def put(url, options)
      response = @connection.put(url, &build_request(options))
      [response.body, response.status, response.headers]
    end

    # @param [String] url
    # @param [Hash] options { headers: {}, query_url: {}, body: {} }
    # @return [Array][String, String, Hash]
    def delete(url, options)
      response = @connection.delete(url, &build_request(options))
      [response.body, response.status, response.headers]
    end

    private

    # @param [Hash] options { headers: {}, query_url: {}, body: {} }
    # @return [Proc]
    def build_request(options)
      proc do |req|
        req.headers.merge!(options[:headers]) if options[:headers]
        req.params.merge!(options[:query_url]) if options[:query_url]
        req.body = JSON.generate(options[:body]) if options[:body]
      end
    end

    class Response < Struct.new(:body, :status, :headers); end
  end

  FARADAY = HttpClient::Faraday
end
