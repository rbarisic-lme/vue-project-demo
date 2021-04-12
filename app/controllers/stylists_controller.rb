  class StylistsController < ApplicationController
  before_action :authenticate_stylist!

  def app
    @vue_app = "stylists"
  end
end
