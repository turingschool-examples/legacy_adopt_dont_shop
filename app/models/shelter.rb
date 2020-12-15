require 'factory_bot'

class Shelter < ApplicationRecord
  has_many :pets
end
