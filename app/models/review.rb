class Review < ApplicationRecord
  belongs_to :user

  validates :author, :email, :rating_quality, :rating_timeliness, :rating_communication, presence: true

  before_save :calculate_overall_rating

  def overall_rating_2f
    sprintf("%.2f", self.overall_rating)
  end

  def calculate_overall_rating
    self.overall_rating = sprintf("%.2f", ((rating_quality + rating_timeliness + rating_communication) / 15) * 5)
  end
end
