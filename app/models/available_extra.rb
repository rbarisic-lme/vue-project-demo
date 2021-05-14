class AvailableExtra < ApplicationRecord
  validates :price, presence: true

  belongs_to :service_extra, touch: true
  belongs_to :user, touch: true

  validates_uniqueness_of :service_extra_id, :scope => :user_id

  before_save :check_duplicate

  private
    def check_duplicate
      # byebug if AvailableExtra.where(user_id: self.user_id, service_extra_id: self.service_extra_id).count > 1
      # new_price = self.price

      # self = AvailableExtra.find(self.id)
      # self.price = new_price
    end
end