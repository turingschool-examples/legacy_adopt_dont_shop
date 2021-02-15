class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  validates_presence_of :name, :street_address, :state, :city, :zip_code, :description

end
