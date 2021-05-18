class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  #= Devise Related ===========================================================
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, :jwt_authenticatable, omniauth_providers: [:facebook], jwt_revocation_strategy: self

  self.skip_session_storage = [:http_auth, :params_auth]
  #============================================================================

  before_save :sanitize_strings
  
  before_create :build_default_business
  before_create :build_default_bank_account
  before_create :generate_md5_identifier

  after_validation :geocode

  geocoded_by :address
  geocoded_by :address, latitude: :address_latitude, longitude: :address_longitude  # ActiveRecord

  has_one :business, dependent: :destroy
  has_one :bank_account, dependent: :destroy, as: :owner

  has_one_attached :avatar
  validates :avatar, content_type: ["image/png", "image/jpeg"]

  enum role: {
    bride: 'bride',
    stylist: 'stylist',
    admin: 'admin'
  }

  # def on_jwt_dispatch(token, payload)
  #   super
  #   # do_something(token, payload)
  # end

  validates :first_name, presence: true
  validates :last_name, presence: true

  def generate_md5_identifier
    self.md5_identifier = Digest::MD5.new.update(self.created_at.hash.to_s + self.first_name + self.last_name + self.id.to_s).hexdigest
  end

  def kyc_verified?
    !self.kyc_denied_at? && self.kyc_verified_at? && self.kyc_verified_at > self.kyc_updated_at && self.kyc_verified_with_workflow

  end

  def initials
    self.first_name[0] + self.last_name[0]
  end

  def address
    [street, zipcode, city, country].compact.join(', ')
  end

  def workspace_address
    [workspace_street, workspace_zipcode, workspace_city, workspace_country].compact.join(', ')
  end

  def request_getid_jwt_token
    # curl -H "X-SDK-Key: 'sdk-key'" -H "Content-Type: application/json" -X POST https://brildlx.getid.ee/sdk/v2/token
    # result = nil

    # begin
      result = HTTParty.post(ENV['getid_jwt_endpoint'], headers: {
        'Content-Type' => 'application/json',
        'X-SDK-Key'    => ENV['getid_sdk_key'],
      })

    # rescue

    # end

    result
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

    def sanitize_numbers
    end
end 
