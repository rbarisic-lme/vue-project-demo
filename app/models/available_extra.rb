class AvailableExtra < ApplicationRecord
  validates :price, presence: true

  belongs_to :service_extra
  belongs_to :user

  validates_uniqueness_of :service_extra_id, :scope => :user_id
end