class Brand < ApplicationRecord
  has_and_belongs_to_many :stylists
end