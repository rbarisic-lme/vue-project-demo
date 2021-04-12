class Stylists::SessionsController < Devise::SessionsController
  # skip_before_action :authenticate_user!, only: [:new]

  respond_to :json

  protected
    def after_sign_in_path_for(resource)
      "/stylists/"
    end
end
