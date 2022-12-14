class Api::V1::StylistsController < ApplicationController
  before_action :set_stylist, only: %i[ show update destroy ]

  before_action :authenticate_user!, unless: -> { request.format == :json }

  # hinder stylists from tampering with other stylists
  before_action :check_current_stylist, only: %i[ current update destroy ]
  before_action :sanitize_params, only: %i[ create update ]

  def public
    @stylist = Stylist.find_by(md5_identifier: params[:md5_identifier])
    respond_to do |format|
      format.json do
        if @stylist.profile_published || (current_stylist && current_stylist.id == @stylist.id)
          render :show_public, status: :ok
        else
          redirect_unauthorized
        end
      end
    end
  end

  def current
    @stylist = current_stylist
  end
 
  # GET /api/v1/stylists or /api/v1/stylists.json
  def index
    @stylists = Stylist.all
  end

  # GET /api/v1/stylists/1 or /api/v1/stylists/1.json
  def show
  end

  # POST /api/v1/stylists or /api/v1/stylists.json
  def create
    @stylist = Stylist.new(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/stylists/1 or /api/v1/stylists/1.json
  def update
    # @stylist.available_extras.build
    respond_to do |format|
      # @stylist.available_extras.build(stylist_params["available_extras_attributes"])

      if @stylist.update(stylist_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_mandate
    send_data(
      current_stylist.create_mandate_pdf,
      filename: "Abrechnungsvollmacht-#{current_stylist.initials}.pdf",
      type: "application/pdf"
    )
  end

  # DELETE /api/v1/stylists/1 or /api/v1/stylists/1.json
  def destroy
  #   @stylist.destroy
  #   respond_to do |format|
  #     format.json { head :no_content }
  #   end
  end

  private
    def sanitize_params
      # array_relations = %w(brand_ids language_ids)

      # array_relations.each do |ar|
      #   if params["stylist"][ar] && params["stylist"][ar].class == String
      #     params["stylist"][ar] = params["stylist"][ar].split(',')
      #   end
      # end

      available_extras = params["stylist"]["available_extras_attributes"]
      skills  = params["stylist"]["skills_attributes"]
      certifications  = params["stylist"]["certifications_attributes"]
      portfolio_images  = params["stylist"]["portfolio_images_attributes"]

      if available_extras
        params["stylist"]["available_extras_attributes"] = available_extras.map do |extra|
          json_extra = JSON.parse(extra).merge user_id: current_stylist.id
          # AvailableExtra.find_or_initialize_by(service_extra_id: json_extra["service_extra_id"], price: json_extra["price"], user_id: current_stylist.id)
        end
      end

      if skills
        params["stylist"]["skills_attributes"] = skills.map do |skill|
          json_skill = JSON.parse(skill).merge user_id: current_stylist.id
        end
      end

      if certifications
        params["stylist"]["certifications_attributes"] = certifications.map do |cert|
          json_cert = JSON.parse(cert).merge user_id: current_stylist.id
        end
      end

      if portfolio_images
        params["stylist"]["portfolio_images_attributes"] = portfolio_images.map do |pi|
          json_pi = JSON.parse(pi).merge user_id: current_stylist.id
        end
      end

      # params["stylist"]["sustainable_materials_percent"]&.to_f
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stylist
      @stylist = Stylist.with_attached_avatar.find(params[:id])
    end

    def current_stylist
      # Stylist.find(current_user.id)
      current_user
    end

    def check_current_stylist
      #unauthorized = 401
      render('redirect_unauthorized', status: :unauthorized) and return unless current_stylist && current_stylist.stylist?
    end

    # Only allow a list of trusted parameters through.
    def stylist_params
      %w(language brand).each do |col|
        if params[:stylist]["reset_#{col}s".to_sym] == '_empty'
          params[:stylist].delete "reset_#{col}s".to_sym
          params[:stylist]["#{col}_ids".to_sym] = []
        end
      end

      params.fetch(:stylist).permit(
        :avatar, :about_me,
        :street, :city, :zipcode, :country,
        :workspace_street, :workspace_city, :workspace_zipcode, :workspace_country,
        :service_radius,
        :service_mobility,
        :service_package_basic_hair_price,
        :service_package_basic_makeup_price,
        :service_package_standard_price,
        :service_package_premium_price,
        :stylist_tutorial_read,
        :sustainable_materials_percent,
        :invoice_mandate_accepted,
        :empty_available_extras,
        :profile_published,
        :reset_languages,
        :kyc_pending,
        brand_ids: [], language_ids: [],
        skills_attributes: [
          :id,
          :user_id,
          :name,
          :level,
          :_destroy,
        ],
        available_extras_attributes: [
          :id,
          :service_extra_id,
          :user_id,
          :price,
          :_destroy,
        ],
        portfolio_images_attributes: [
          :id,
          :_destroy,
          :user_id,
          :image
        ],
        certifications_attributes: [
          :id,
          :user_id,
          :title,
          :certified_by,
          :start_date,
          :end_date,
          :body,
          :_destroy,
        ]
      )
    end
end
