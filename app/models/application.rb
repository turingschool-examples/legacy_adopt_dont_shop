class Application < ApplicationRecord
  has_many :pet_applications
  has_many :applications, through: :pet_applications
end
