class BankAccount < ApplicationRecord
  attr_encrypted :iban, key: ENV['encryption_key']

  belongs_to :owner, polymorphic: true
  # validates :full_name, :street, :zipcode, :city, :country, :iban, presence: true
  # validates :iban, format: { with: /\A\S{1,2}\d{2}[\da-zA-Z]{8,32}\z/ }, if: -> { iban.present? }
end
