module Api
  module V1
    class PortfoliosController < BaseController
      def show
        # authorize!(User, :notifications, portfolio, current_user)

        portfolio = PortfolioReport.new(current_user).twr
        # respond(notifications, each_serializer: Api::V1::PortfolioSerializer, status: :ok)
        respond(portfolio, status: :ok)
      end
    end
  end
end
