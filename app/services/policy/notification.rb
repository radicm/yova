module Policy
  class Notification
    def self.create(_, user)
      user.admin?
    end

    def self.send_notification(_, user)
      user.admin?
    end

    def self.index(_, user)
      user.admin?
    end
  end
end
