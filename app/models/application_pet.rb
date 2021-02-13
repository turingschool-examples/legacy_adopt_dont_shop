class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pets
end
