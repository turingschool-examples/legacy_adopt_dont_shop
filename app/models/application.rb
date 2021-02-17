class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  validates_presence_of :name, :street_address, :city, :state, :zip_code


end
