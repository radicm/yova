module Api
  module V1
    class UsersController < BaseController
      skip_before_action :create_session, raise: false

      def notifications
        notifications = CommunicationGateway.new.fetch(current_user.id)

        authorize!(User, :notifications, notifications, current_user)

        respond(notifications, each_serializer: Api::V1::NotificationSerializer, status: :ok)
      end

      def portfolios
        user = User.find(params[:user_id])

        authorize!(User, :portfolios, user, current_user)

        portfolio = PortfolioReport.new(user).twr

        respond(portfolio, status: :ok)
      end
    end
  end
end
