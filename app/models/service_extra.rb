class ServiceExtra < ApplicationRecord
  validates :name, presence: true

  has_many :available_extras
  has_many :users, through: :available_extras, class_name: 'AvailableExtra'
end
