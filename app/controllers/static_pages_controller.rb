class StaticPagesController < ApplicationController

  def landing_page
    @vue_app = "landing_page"
  end

  def static_page_content
    @content = StaticPage.find_by(title: params[:title])

    respond_to do |format|
      format.html { render text: @content.body }
      format.json { render json: @content }
    end
  end

  # def about_us
  # end

  # def imprint
  # end

  # def privacy
  # end

  # def terms

  # end

  # def become_a_stylist
  #   if current_user && current_user.type == "Stylist"
  #     redirect_to stylist_app_path
  #   end

  #   @vue_app = "become_a_stylist"
  # end

  protected
end
