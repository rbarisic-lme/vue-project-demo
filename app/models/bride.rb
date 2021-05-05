class Bride < User
  before_save :sanitize_strings

  private
    def sanitize_strings
      super
      self.about_me = ActionView::Base.full_sanitizer.sanitize(self.about_me)
    end

    # def sanitize_numbers
    #   self.service_radius.to_i
    # end
end 
