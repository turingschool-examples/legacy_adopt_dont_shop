class Application < ApplicationRecord
  validates_presence_of :status, :name, :street, :city, :state, :zip, :description
  has_many :application_pets
  has_many :pets, through: :application_pets

  def pet_names
    pets.pluck(:name)
  end
end 