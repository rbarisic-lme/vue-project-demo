class Stylist < User
  attr_accessor :empty_available_extras
  before_save :check_empty_available_extras  
  before_save :sanitize_strings

  after_create :create_mandate_pdf
  
  has_and_belongs_to_many :brands, foreign_key: :user_id
  has_and_belongs_to_many :languages, foreign_key: :user_id

  has_many :skills, foreign_key: :user_id, dependent: :delete_all

  has_many :certifications, foreign_key: :user_id, dependent: :delete_all

  has_many :reviews, foreign_key: :user_id, dependent: :delete_all

  has_many :available_extras, foreign_key: :user_id, dependent: :delete_all
  has_many :service_extras, through: :available_extras, foreign_key: :user_id, class_name: 'AvailableExtras'

  has_many :portfolio_images, foreign_key: :user_id, dependent: :delete_all

  validate :brands_format

  validates :sustainable_materials_percent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_blank: true

  accepts_nested_attributes_for :available_extras, allow_destroy: true
  accepts_nested_attributes_for :skills, allow_destroy: true
  accepts_nested_attributes_for :certifications, allow_destroy: true
  accepts_nested_attributes_for :portfolio_images, allow_destroy: true

  def overall_ratings
    if self.reviews.any?
      (self.reviews.pluck(:overall_rating).reduce do |sum, rating|
        sum + rating
      end / self.reviews.count).to_f
    else
      []
    end
  end

  def overall_ratings_detailed
    if self.reviews.any?

      ratings = self.reviews.pluck(:rating_quality, :rating_timeliness, :rating_communication).reduce({}) do |sum, ratings|
        sum[:rating_quality].present? ? sum[:rating_quality] += ratings[0] : sum[:rating_quality] = ratings[0]
        sum[:rating_timeliness].present? ? sum[:rating_timeliness] += ratings[0] : sum[:rating_timeliness] = ratings[1]
        sum[:rating_communication].present? ? sum[:rating_communication] += ratings[0] : sum[:rating_communication] = ratings[2]

        sum
      end

      ratings[:rating_quality] = (ratings[:rating_quality] / self.reviews.count).round.to_i
      ratings[:rating_timeliness] = (ratings[:rating_timeliness] / self.reviews.count).round.to_i
      ratings[:rating_communication] = (ratings[:rating_communication] / self.reviews.count).round.to_i

      ratings
    else
      {}
    end

    # ratings = ratings.map do |key, rating|
    #   [key, (rating / self.reviews.count).round.to_i]
    # end
  end

  def ratings_by_stars
    self.reviews.pluck(:overall_rating).reduce({}) do |sum, rating|
      key = rating.round.to_s

      if sum[key]
        sum[key] += 1
      else
        sum[key] = 1
      end

      sum
    end
  end

  def tutorial_read!
    self.stylist_tutorial_read = true
    self.save!
  end

  def tutorial_read?
    self.stylist_tutorial_read
  end

  def business_data_completed?
    self.business
  end

  def ready_for_kyc?
    self.bank_account.bank_account_data_complete? && self.business.business_data_complete?
  end

  def create_mandate_pdf
    MandateUser.new(self).generate
  end

  private

    def check_empty_available_extras
      if empty_available_extras.present?
        self.available_extras.each do |ae|
          ae.destroy!
        end
      end
    end

    def sanitize_strings
      super
      self.about_me = ActionView::Base.full_sanitizer.sanitize(self.about_me)
    end

    # def sanitize_numbers
    #   self.service_radius.to_i
    # end

    def brands_format
      # if self.brands
        # errors.add(:brands, :invalid)
      # end
    end

end 
