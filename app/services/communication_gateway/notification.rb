class CommunicationGateway
  class Notification < Base
    def initialize(_config = {})
      super
    end

    # @param [String] content
    def create(content)
      ::Notification.create(content: content)
    end

    # @param [Integer] id
    # @param [Integer] user_ids
    def push(id, user_ids)
      notification = ::Notification.find(id)
      User.find(user_ids)

      false if notification.nil?

      notification.update(user_ids: (notification.user_ids + user_ids).uniq)
    end

    # @param [Integer] user_id
    def fetch(user_id)
      notifications = ::Notification.joins(:notifications_users).where(notifications_users: { user_id: user_id })

      notifications.each do |notification|
        notification.update(seen_at: DateTime.now) if notification.seen_at.nil?
      end

      return false if notifications.blank?

      notifications
    end

    # @param [Integer] user_id
    def list(user_id = nil)
      if user_id.nil?
        ::Notification.all
      else
        ::Notification.joins(:notifications_users).where(notifications_users: { user_id: user_id })
      end
    end
  end

  NOTIFICATION = CommunicationGateway::Notification
end
