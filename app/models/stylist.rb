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


  has_one_attached :avatar

  has_and_belongs_to_many :brands

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

  private
    def brands_format
      # if self.brands
        # errors.add(:brands, :invalid)
      # end
    end

end 
