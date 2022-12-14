class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, unless: -> { request.format == :json }

  # hinder users from tampering with other users
  before_action :check_current_user, only: %i[ current update destroy ]
  before_action :sanitize_params, only: %i[ create update ]

  def current
    @user = current_user
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def request_jwt_getid
    @result = current_user.request_getid_jwt_token

    respond_to do |format|
      format.json { render json: @result.body }
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created } #location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    exit if params["user"].include? "role" && params["user"]["role"] == "admin"

    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok } #location: @user }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to api_v1_users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def sanitize_params
      raise 'tried to hack admin!' if params["user"]["role"] == 'admin'
      raise 'tried to hack admin!' if params["user"]["type"] == 'admin'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def check_current_user
      render('redirect_unauthorized', status: :unauthorized) and return unless current_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(
        :type,
        :role
      )
    end
end
