class Api::V1::StylistsController < ApplicationController
  before_action :set_stylist, only: %i[ show update destroy ]

  before_action :authenticate_stylist!, unless: -> { request.format == :json }

  # hinder users from tempering with other users
  before_action :check_current_stylist, only: %i[ current show update destroy authenticated ]

  before_action :sanitize_params, only: %i[ create update ]

  def current
    @stylist = current_stylist
  end

  def authenticated
    render inline: {authorized: true}.to_json
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
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
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
      array_relations = %w(brand_ids language_ids)

      array_relations.each do |ar|
        if params["stylist"][ar] && params["stylist"][ar].class == String
          params["stylist"][ar] = params["stylist"][ar].split(',')
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_stylist
      @stylist = Stylist.with_attached_avatar.find(params[:id])
    end

    def check_current_stylist
      render 'redirect_unauthorized' and return unless current_stylist
    end

    # Only allow a list of trusted parameters through.
    def stylist_params
      params.fetch(:stylist).permit(
        :avatar, :about_me,
        :street, :city, :zipcode, :country,
        :service_radius,
        brand_ids: [], language_ids: []
      )
    end
end
