class Business < ApplicationRecord
  belongs_to :user

  def business_data_complete?
    complete = true

    %i(name city street zipcode country legal_form
       tax_id tax_rate).each do |attr|
        complete = false if self[attr].blank?
    end

    return complete
  end
end
