class PortfolioImage < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  validates :image, content_type: ["image/png", "image/jpeg"]
end
