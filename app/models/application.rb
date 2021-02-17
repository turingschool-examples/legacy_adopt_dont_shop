class Application < ApplicationRecord

  validates_presence_of :name, :address, :description

  has_many :application_pets
  has_many :pets, through: :application_pets

  def add_pet(pet_id)
    ApplicationPet.create(pet_id: pet_id, application_id: id)
  end

end
