require 'factory_bot'

class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet
end
