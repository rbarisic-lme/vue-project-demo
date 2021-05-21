class Review < ApplicationRecord
  attr_accessor :accept_terms
  
  belongs_to :user

  validates :accept_terms, :author, :email, :rating_quality, :rating_timeliness, :rating_communication, presence: true, on: :create

  before_save :calculate_overall_rating

  validates_uniqueness_of :email


  def overall_rating_2f
    sprintf("%.2f", self.overall_rating)
  end

  def calculate_overall_rating
    self.overall_rating = sprintf("%.2f", ((rating_quality + rating_timeliness + rating_communication) / 15) * 5)
  end

  def self.generate_verification_token
    ('A'..'Z').to_a.shuffle.slice(0,6).join
  end
end
