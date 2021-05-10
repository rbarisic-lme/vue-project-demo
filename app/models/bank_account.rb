class BankAccount < ApplicationRecord
  attr_encrypted :iban, key: ENV['encryption_key']

  belongs_to :owner, polymorphic: true
  # validates :full_name, :street, :zipcode, :city, :country, :iban, presence: true
  before_validation :sanitize_input

  validates :iban, format: { with: /\A\S{1,2}\d{2}[\da-zA-Z]{8,32}\z/ }, if: -> { iban.present? }

  validate :validate_all_fields

  def bank_account_data_complete?
    complete = true

    %i(full_name street zipcode city country encrypted_iban).each do |attr|
      complete = false if self[attr].blank?
    end

    return complete
  end

  private
    def sanitize_input
      self.iban = iban.delete(" \t\r\n") if iban.present?
    end

    def validate_all_fields
      fields = %i[full_name street zipcode city country]
      all_blank = true

      fields.each do |field|
        all_blank = false if self[field].present?
      end

      unless all_blank
        fields.each do |field|
          errors.add(field, :blank, message: "can't be blank") if self[field].blank?
        end
      end

    end
end
