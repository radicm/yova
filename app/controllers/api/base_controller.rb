module Api
  class BaseController < ApplicationController
    before_action :set_current_user

    attr_accessor :current_user

    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                Authorization::NotAuthorizedError,
                I18n::InvalidLocale,
                with: :handle_exception

    def handle_exception(exception)
      status = case exception
               when ActiveRecord::RecordNotFound then :not_found
               when ActionController::RoutingError then :bad_request
               when Authorization::NotAuthorizedError then :unauthorized
               else :internal_server_error
               end

      message = case status
                when :internal_server_error
                  "We are sorry, something went wrong"
                when :not_acceptable
                  "#{exception.message}, we support locales #{I18n.available_locales.join(', ')}."
                else
                  exception.message
                end

      respond(nil, message: message, status: status)
    end

    def authorize!(policy, action, data, user_id)
      ::Authorization.validate(policy, action, data, user_id)
    end

    def set_current_user
      token = request.headers["x-auth-token"]
      user  = Authentication.fetch_user_by_session_token(token)

      unless user
        render json: { error: "Unauthorized!" }, status: :unauthorized
      end

      @current_user = user
    end

    def respond(data, args = {})
      serializer      = args.delete(:serializer)
      each_serializer = args.delete(:each_serializer)
      serializer_args = args.delete(:serializer_args)
      status          = args.fetch(:status, :ok)
      meta            = args.except(:status, :paginate) { {} }

      if data.blank? # Hack because AMS does not handle nil serialization
        render json: { data: data, meta: meta }, status: status
      else
        rendering_args                   = {
          json:    data,
          meta:    meta,
          root:    "data",
          adapter: :json,
          status:  status
        }
        rendering_args[:serializer]      = serializer unless serializer.nil?
        rendering_args[:each_serializer] = each_serializer unless each_serializer.nil?

        render(rendering_args.merge(serializer_args || {}))
      end
    end
  end
end
