class StylistsController < ApplicationController
  # before_action :authenticate_stylist!

  before_action :redirect_unless_logged_in


  def app
    @vue_app = "stylists"
  end

  private
    def redirect_unless_logged_in
      # redirect_to root_path unless current_stylist
    end
end
