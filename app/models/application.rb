class Application < ApplicationRecord

  validates_presence_of :name, :address, :description

  has_many :application_pets
  has_many :pets, through: :application_pets

end
