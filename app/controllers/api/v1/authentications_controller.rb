module Api
  module V1
    class AuthenticationsController < BaseController
      skip_before_action :set_current_user, only: [:login, :logout]

      def login
        token = ::Authentication.create_session(params[:email], params[:password])

        respond({ token: token }, status: 200)
      end

      def logout
        ::Authentication.destroy_session(params[:token])

        respond(nil, status: 200)
      end
    end
  end
end
