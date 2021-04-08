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

  def become_a_stylist
    @vue_app = "become_a_stylist"
  end
end
