class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zip, :description, :status
  has_many :pet_applications
  has_many :pets, through: :pet_applications
end
