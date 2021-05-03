class Api::V1::BankAccountsController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  before_action :set_bank_account, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, unless: -> { request.format == :json }
  before_action :check_current_user, only: %i[ current show update destroy authenticated ]

  # GET /bank_accounts or /bank_accounts.json
  def index
    @bank_accounts = BankAccount.all
  end

  # GET /bank_accounts/1 or /bank_accounts/1.json
  def show
  end

  def current
    @bank_account = current_user.bank_account
  end

  # GET /bank_accounts/new
  def new
    @bank_account = BankAccount.new
  end

  # GET /bank_accounts/1/edit
  def edit
  end

  # POST /bank_accounts or /bank_accounts.json
  def create
    @bank_account = BankAccount.new(bank_account_params)

    respond_to do |format|
      if @bank_account.save
        format.json { render :show, status: :created } # location: @bank_account }
      else
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_accounts/1 or /bank_accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.json { render :show, status: :ok } # location: @bank_account }
      else
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_accounts/1 or /bank_accounts/1.json
  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.fetch(:bank_account, {}).permit(:full_name, :street, :zipcode, :city, :country, :iban, :bic)
    end
end
