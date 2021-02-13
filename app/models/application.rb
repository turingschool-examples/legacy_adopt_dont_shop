class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets


  def pets
    pet_ids.map do |id|
      Pet.find(id)
    end
  end
end