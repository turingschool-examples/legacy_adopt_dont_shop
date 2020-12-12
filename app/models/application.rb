class Application < ApplicationRecord
    belongs_to :applicant
    has_many :application_pets
    has_many :pets, through: :application_pets
end
