class StaticPagesController < ApplicationController
  def landing_page
    @vue_app = "landing_page"
  end

  def about_us
  end

  def imprint
  end

  def privacy
  end
end
