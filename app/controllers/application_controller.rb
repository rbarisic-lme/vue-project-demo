class ApplicationController < ActionController::Base
  before_action :authenticate_http if Rails.env.production?

  # before_action :authenticate_user!
  # before_action :authenticate_stylist!

  protected
    def authenticate_http
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["httpasswd_username"] && password == ENV["httpasswd_password"]
      end
    end
end
