class Stylists::RegistrationsController < Devise::RegistrationsController
  # skip_before_action :authenticate_user!, only: [:new]

  respond_to :json

  protected
    def after_sign_up_path_for(resource)
      "http://www.google.com" # <- Path you want to redirect the user to after signup
    end
end
