class Application < ApplicationRecord

  validates_presence_of :name, :address

  has_many :application_pets
  has_many :pets, through: :application_pets

  def add_pet(pet_id)
    ApplicationPet.create(pet_id: pet_id, application_id: id)
  end

  def add_description(description)
    self.description = description
  end

  def submit
    self.status = "Pending"
  end

  def check_status
    if (application_pets.all?  { |application_pet| application_pet.status == :approved}) == false
      update(status: :approved)
    elsif (application_pets.any?  { |application_pet| application_pet.status == :rejected}) == false
      update(status: :rejected)
    end
  end
end
