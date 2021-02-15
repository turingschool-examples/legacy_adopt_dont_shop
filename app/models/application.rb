class Application < ApplicationRecord
  validates_presence_of :name,
                        :street_address,
                        :city,
                        :state,
                        :zip_code,
                        :description_of_applicant,
                        :pet_name,
                        :application_status

  has_many :application_pets
  has_many :pets, through: :application_pets
end
