class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application
  validates :pet_id, uniqueness: { scope: :application_id }

  def self.check_pet_apps_with_app_id(app_id)
    where(application_id: app_id)
  end
end
