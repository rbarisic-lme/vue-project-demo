class Stylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  self.skip_session_storage = [:http_auth, :params_auth]

  has_one_attached :avatar

  # def on_jwt_dispatch(token, payload)
  #   super
  #   # do_something(token, payload)
  # end

  validates :first_name, presence: true
  validates :last_name, presence: true

  def initials
    self.first_name[0] + self.last_name[0]
  end
end
