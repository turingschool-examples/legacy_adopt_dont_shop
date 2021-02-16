class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def self.approve(app_pet_id, app_application_id)
    binding.pry
    find_by(pet_id: app_pet_id, application_id: app_application_id)
  end

  def self.status(app_pet_id, app_application_id)
    binding.pry
    result = find_by(pet_id: app_pet_id, application_id: app_application_id)
    result.application_status
  end
end
