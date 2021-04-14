class Api::V1::StylistsController < ApplicationController
  before_action :set_stylist, only: %i[ show edit update destroy ]
 
  # GET /api/v1/stylists or /api/v1/stylists.json
  def index
    @stylists = Stylist.all
  end

  # GET /api/v1/stylists/1 or /api/v1/stylists/1.json
  def show
  end

  # GET /api/v1/stylists/new
  def new
    @stylist = Stylist.new
  end

  # GET /api/v1/stylists/1/edit
  def edit
  end

  # POST /api/v1/stylists or /api/v1/stylists.json
  def create
    @stylist = Stylist.new(stylist_params)

    respond_to do |format|
      if @stylist.save
        format.json { render :show, status: :created, location: @stylist }
      else
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/stylists/1 or /api/v1/stylists/1.json
  def update
    respond_to do |format|
      if @stylist.update(stylist_params)
        format.json { render :show, status: :ok, location: @stylist }
      else
        format.json { render json: @stylist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/stylists/1 or /api/v1/stylists/1.json
  def destroy
    @stylist.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stylist
      @stylist = Stylist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stylist_params
      params.fetch(:stylist, {})
    end
end
