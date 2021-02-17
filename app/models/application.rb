class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets
  validates_presence_of :applicant_name, :applicant_address, :state, :city, :zip
end
