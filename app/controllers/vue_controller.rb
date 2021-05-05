class VueController < ApplicationController
  # before_action :authenticate_stylist!

  before_action :redirect_unless_logged_in

  def stylist_app
    @vue_app = "stylists"
  end

  def bride_app
    @vue_app ="brides"
  end

  def user_app
    @vue_app = "users"
  end

  private
    def redirect_unless_logged_in
      # redirect_to root_path unless current_stylist
    end
end
