class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  # before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: [:new]
  skip_before_action :verify_authenticity_token

  def create
    super do
      @token = current_token
      render "users/registrations/create" and return
    end
  end

  private
    # def respond_with(resource, _opts = {})
      # render json: resource
    # end
    
    # def respond_to_on_destroy
      # head :ok
    # end

    def current_token
      request.env['warden-jwt_auth.token']
    end

  protected
    # def after_sign_up_path_for(resource)
      # "http://www.google.com" # <- Path you want to redirect the user to after signup
    # end
end
