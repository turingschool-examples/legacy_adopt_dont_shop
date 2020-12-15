class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application
  validates :pet_id, uniqueness: { scope: :application_id }
end
