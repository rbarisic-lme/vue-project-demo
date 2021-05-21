class Api::V1::ReviewsController < ApplicationController
  before_action :sanitize_params, only: %i[ new create edit update destroy ]
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :check_for_blackhats, only: %i[ create update ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  def verify
    @review = Review.find(params["id"])
    @token = params["token"]

    if @review.email_verification_token == @token
      @review.email_confirmed_at = DateTime.now

      @review.save!

      respond_to do |format|
        format.html { redirect_to :root }
      end
    end
    # http://localhost:3000/reviews/v?id=16&token=ACKJET
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.email_verification_token = Review.generate_verification_token

    respond_to do |format|
      if @review.save!
        ReviewMailer.with(to_mail: review_params["email"], review: @review).verifiy_email.deliver_now
        format.json { render :show, status: :created }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def sanitize_params
      email = params["review"]["email"]
      email = email.downcase.chomp if email
    end

    def check_for_blackhats
      email = params["review"]["email"]
      user_id = params["review"]["user_id"]

      if params["review"] && email && user_id
        respond_to do |format|
          format.json { render json: {error: "Tried to upvote self"}, status: 406 if User.find(user_id).email == email }
        end
      end 
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.fetch(:review, {}).permit(
        :user_id,
        :author,
        :email,
        :body,
        :rating_quality,
        :rating_timeliness,
        :rating_communication,
        :accept_terms
      )
    end
end
