class Api::V1::AuthController < ApplicationController
  before_action :authenticate_user!, unless: -> { request.format == :json }
  # before_action :check_current_user, only: %i[ current show update destroy authenticated ]

  def authenticated
    render inline: {authorized: true}.to_json
  end
end