class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  #= Devise Related ===========================================================
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  self.skip_session_storage = [:http_auth, :params_auth]
  #============================================================================

  before_save :sanitize_strings
  
  before_create :build_default_business
  before_create :build_default_bank_account

  after_validation :geocode

  geocoded_by :address
  geocoded_by :address, latitude: :address_latitude, longitude: :address_longitude  # ActiveRecord

  has_one :business, dependent: :destroy
  has_one :bank_account, dependent: :destroy, as: :owner

  has_one_attached :avatar

  enum role: [:bride, :stylist, :admin]

  # def on_jwt_dispatch(token, payload)
  #   super
  #   # do_something(token, payload)
  # end

  validates :first_name, presence: true
  validates :last_name, presence: true


  def initials
    self.first_name[0] + self.last_name[0]
  end

  def address
    [street, zipcode, city, country].compact.join(', ')
  end

  def workspace_address
    [workspace_street, workspace_zipcode, workspace_city, workspace_country].compact.join(', ')
  end

  private
    def build_default_business
      build_business
      true
    end

    def build_default_bank_account
      build_bank_account
      true
    end

    def sanitize_strings
    end

    # def sanitize_numbers
    #   self.service_radius.to_i
    # end

end 
