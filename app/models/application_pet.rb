class ApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  enum status: [:approved, :rejected]


  def update_pet_status
    if status == "approved"
      pet.update(adoptable: false)
    end
  end

end
