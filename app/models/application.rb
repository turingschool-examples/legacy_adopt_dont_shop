class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates_presence_of :first_name, :last_name

  validates :zipcode, numericality: {
              greater_than_or_equal_to: 0
            }

  enum status: [:in_progress, :pending, :accepted, :rejected]
end
