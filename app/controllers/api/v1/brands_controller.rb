class Api::V1::BrandsController < ApplicationController
  before_action :set_api_v1_brand, only: %i[ show edit update destroy ]

  # GET /api/v1/brands or /api/v1/brands.json
  def index
    @api_v1_brands = Api::V1::Brand.all
  end

  # GET /api/v1/brands/1 or /api/v1/brands/1.json
  def show
  end

  # GET /api/v1/brands/new
  def new
    @api_v1_brand = Api::V1::Brand.new
  end

  # GET /api/v1/brands/1/edit
  def edit
  end

  # POST /api/v1/brands or /api/v1/brands.json
  def create
    @api_v1_brand = Api::V1::Brand.new(api_v1_brand_params)

    respond_to do |format|
      if @api_v1_brand.save
        format.html { redirect_to @api_v1_brand, notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/brands/1 or /api/v1/brands/1.json
  def update
    respond_to do |format|
      if @api_v1_brand.update(api_v1_brand_params)
        format.html { redirect_to @api_v1_brand, notice: "Brand was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/brands/1 or /api/v1/brands/1.json
  def destroy
    @api_v1_brand.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_brands_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_brand
      @api_v1_brand = Api::V1::Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_brand_params
      params.fetch(:api_v1_brand, {})
    end
end
