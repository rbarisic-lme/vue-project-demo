class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_stylist!, unless: -> { request.format == :json }

  # before_action :authenticate_http if Rails.env.production?
  # callback to set CSRF TOKEN for non-idempotent Ajax request
  after_action :add_csrf_token_to_json_request_header

  private

    def auth_header
      request.headers['Authorization']
    end

    def jwt_token
      auth_header.split[1]
    end

    def current_user
      if auth_header && auth_header.match?(/\ABearer .+\z/)
        Warden::JWTAuth::UserDecoder.new.call(jwt_token, :user, nil)
      elsif cookies[:jwt]
        Warden::JWTAuth::UserDecoder.new.call(cookies[:jwt], :user, nil)
      else
        nil
      end
    end

    def add_csrf_token_to_json_request_header
      if request.format.json? && protect_against_forgery?
        response.headers['X-CSRF-Token'] = form_authenticity_token
      end
    end

    def set_user
      @user = current_user
    end

    def check_current_user
      render 'redirect_unauthorized' and return unless current_user
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def authenticate_http
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["httpasswd_username"] && password == ENV["httpasswd_password"]
      end
    end
end
