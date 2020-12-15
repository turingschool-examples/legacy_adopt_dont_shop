class ApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def self.find_by_name(search)
    Pet.where("name like ?", "%#{search}%")
  end
end
