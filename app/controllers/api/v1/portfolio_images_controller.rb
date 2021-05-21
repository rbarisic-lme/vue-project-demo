class Api::V1::PortfolioImagesController < ApplicationController
  before_action :set_portfolio_image, only: %i[ show edit update destroy ]

  # GET /portfolio_images or /portfolio_images.json
  def index
    @portfolio_images = PortfolioImage.all
  end

  # GET /portfolio_images/1 or /portfolio_images/1.json
  def show
  end

  # GET /portfolio_images/new
  def new
    @portfolio_image = PortfolioImage.new
  end

  # GET /portfolio_images/1/edit
  def edit
  end

  # POST /portfolio_images or /portfolio_images.json
  def create
    @portfolio_image = PortfolioImage.new(portfolio_image_params)

    respond_to do |format|
      if @portfolio_image.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @portfolio_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_images/1 or /portfolio_images/1.json
  def update
    respond_to do |format|
      if @portfolio_image.update(portfolio_image_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @portfolio_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_images/1 or /portfolio_images/1.json
  def destroy
    @portfolio_image.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_image
      @portfolio_image = PortfolioImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_image_params
      params.fetch(:portfolio_image, {}).permit(
        :image,
        :user_id,
        :id
      )
    end
end
