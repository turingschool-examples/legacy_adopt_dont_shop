class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets
  validates :name, :address, :city, :state, :zip, :description, presence: true
end