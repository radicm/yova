module Api
  module V1
    class NotificationsController < BaseController
      def index
        notifications = CommunicationGateway.new.list(params[:user_id])

        authorize!(Notification, :index, notifications, current_user)

        respond(notifications, each_serializer: Api::V1::NotificationSerializer, status: :ok)
      end

      def send_notification
        authorize!(Notification, :send_notification, nil, current_user)

        notification = CommunicationGateway.new.push(params[:notification_id], params[:user_ids])
        status       = notification ? :ok : :bad_request

        respond(nil, status: status)
      end

      def create
        authorize!(Notification, :create, nil, current_user)

        notification = CommunicationGateway.new.create(params[:content])
        status       = notification ? :ok : :bad_request

        respond(notification, serilazier: Api::V1::NotificationSerializer, status: status)
      end
    end
  end
end
