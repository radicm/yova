class CommunicationGateway
  class Base
    def initialize(_config = {}) end

    # @param [String] _content
    def create(_content)
      raise "Override method!"
    end

    # @param [Integer] _id
    # @param [Integer] _user_ids
    def push(_id, _user_ids)
      raise "Override method!"
    end

    # @param [Integer] _user_id
    def fetch(_user_id)
      raise "Override method!"
    end

    # @param [Integer] _user_ids
    def list(_user_id = nil)
      raise "Override method!"
    end
  end
end
