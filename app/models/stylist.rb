class Stylist < User
  before_save :sanitize_strings
  
  has_and_belongs_to_many :brands, foreign_key: :user_id
  has_and_belongs_to_many :languages, foreign_key: :user_id

  validate :brands_format

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
