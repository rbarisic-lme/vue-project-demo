class Stylist < User
  before_save :sanitize_strings
  
  has_and_belongs_to_many :brands, foreign_key: :user_id
  has_and_belongs_to_many :languages, foreign_key: :user_id

  has_many :available_extras, foreign_key: :user_id
  has_many :service_extras, through: :available_extras, foreign_key: :user_id, class_name: 'AvailableExtras'

  validate :brands_format

  validates :sustainable_materials_percent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  accepts_nested_attributes_for :available_extras

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

  private
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
