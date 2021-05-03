class Api::V1::BusinessesController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :set_business, only: %i[ show update destroy ]

  before_action :authenticate_user!, unless: -> { request.format == :json }
  before_action :check_current_user, only: %i[ current show update destroy authenticated ]

  # GET /businesses or /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1 or /businesses/1.json
  def show
  end

  def current
    @business = current_user.business
  end

  # GET /businesses/new
  # def new
    # @business = Business.new
  # end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses or /businesses.json
  def create
    # @business = Business.new(business_params)

    # respond_to do |format|
    #   if @business.save
    #     format.json { render :show, status: :created, location: @business }
    #   else
    #     format.json { render json: @business.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    # @business.destroy
    # respond_to do |format|
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      # @business = Business.find(params[:id])
      @business = current_user.business
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.fetch(:business, {}).permit(
        :name, :city, :street, :zipcode, :country, :legal_form,
        :tax_id, :vat, :tax_rate
      )
    end
end
