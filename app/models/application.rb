class Application < ApplicationRecord
  validates :name, :city, :state, :description, presence: true
  validates :zip_code, numericality: { only_integer: true }, presence: true
  has_many :application_pets
  has_many :pets, through: :application_pets
end
