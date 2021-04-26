class BankAccount < ApplicationRecord
  belongs_to :owner, polymorphic: true
  # validates :full_name, :street, :zipcode, :city, :country, :iban, presence: true
end
