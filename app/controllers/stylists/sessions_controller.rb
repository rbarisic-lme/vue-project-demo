class Stylists::SessionsController < Devise::SessionsController
  respond_to :json
  # wrap_parameters format: [:json]

  # skip_before_action :verify_authenticity_token, only: :create

  def create
    super do
      @token = current_token
      render "stylists/sessions/create" and return
    end
  end

  private
    def respond_with(resource, _opts = {})
      render json: resource
    end
    
    def respond_to_on_destroy
      head :ok
    end

    def current_token
      request.env['warden-jwt_auth.token']
    end

  protected
    def after_sign_in_path_for(resource)
      "/stylists/"
    end
end
