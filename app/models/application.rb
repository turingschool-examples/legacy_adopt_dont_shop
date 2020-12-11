class Application < ApplicationRecord
  has_many :pets
  has_many :pets, through: :application_pets

end
