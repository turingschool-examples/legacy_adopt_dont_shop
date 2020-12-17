class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :description, presence: true

  #enum status: [:in_progress, ] this is where you can limit the status
  def self.find_pet(name_search)
    Pet.where("LOWER(name) LIKE ?", "%" + name_search.downcase + "%")
  end
end
