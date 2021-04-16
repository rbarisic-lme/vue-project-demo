class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: %i[ show edit update destroy ]

  # GET /api/v1/brands or /api/v1/brands.json
  def index
    @brands = Brand.all
  end

  # GET /api/v1/brands/1 or /api/v1/brands/1.json
  def show
  end

  # GET /api/v1/brands/new
  def new
    @brand = Brand.new
  end

  # GET /api/v1/brands/1/edit
  def edit
  end

  # POST /api/v1/brands or /api/v1/brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: "Brand was successfully created." }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/brands/1 or /api/v1/brands/1.json
  def update
    respond_to do |format|
      if @brand.create_or_update(brand_params)
        format.html { redirect_to @brand, notice: "Brand was successfully updated." }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/brands/1 or /api/v1/brands/1.json
  def destroy
    # @brand.destroy
    # respond_to do |format|
    #   format.html { redirect_to brands_url, notice: "Brand was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_params
      params.fetch(:brand, {})
    end
end
