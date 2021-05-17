class CommunicationGateway
  extend Forwardable

  def_delegators :@gateway, :create, :push, :fetch, :list

  # @param [CommunicationGateway::Object] gateway
  # @param [Hash] config
  def initialize(gateway = NOTIFICATION, config = {})
    @gateway = gateway.new(config)
  end
end
