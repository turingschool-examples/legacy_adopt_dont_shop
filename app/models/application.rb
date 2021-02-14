class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates :first_name, :last_name, :address, :city, :state, :zip,
            :case_for_adoption, presence: true
end
