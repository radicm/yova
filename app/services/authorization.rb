class Authorization
  def self.validate(policy, action, data, user_id)
    raise NotAuthorizedError unless "Policy::#{policy}".constantize.send(action, data, user_id)
  end

  class NotAuthorizedError < StandardError
    def initialize
      super("Unauthorized action!")
    end
  end
end
