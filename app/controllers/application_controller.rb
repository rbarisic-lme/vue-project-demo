class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  # before_action :authenticate_http if Rails.env.production?
  # callback to set CSRF TOKEN for non-idempotent Ajax request
  after_action :add_csrf_token_to_json_request_header

  private

  def add_csrf_token_to_json_request_header
    if request.format.json? && protect_against_forgery?
      response.headers['X-CSRF-Token'] = form_authenticity_token
    end
  end

  protected
    def authenticate_http
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["httpasswd_username"] && password == ENV["httpasswd_password"]
      end
    end
end
