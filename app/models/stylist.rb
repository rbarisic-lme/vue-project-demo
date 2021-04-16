class Stylist < ApplicationRecord
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

  after_validation :geocode

  geocoded_by :address
  geocoded_by :address, latitude: :address_latitude, longitude: :address_longitude  # ActiveRecord

  has_one_attached :avatar

  has_and_belongs_to_many :brands
  has_and_belongs_to_many :languages

  # def on_jwt_dispatch(token, payload)
  #   super
  #   # do_something(token, payload)
  # end

  validates :first_name, presence: true
  validates :last_name, presence: true

  validate :brands_format


  def initials
    self.first_name[0] + self.last_name[0]
  end

  def address
    [street, city, country].compact.join(', ')
  end

  private
    def sanitize_strings
      self.about_me = ActionView::Base.full_sanitizer.sanitize(self.about_me)
    end

    def brands_format
      # if self.brands
        # errors.add(:brands, :invalid)
      # end
    end

end 
