class ApplicationController < ActionController::Base
  before_action :authenticate if Rails.env.production?

protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["httpasswd_username"] && password == ENV["httpasswd_password"]
    end
  end
end
