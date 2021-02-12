class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  validates_presence_of :application_id, :pet_id

  def find_by_application_id(application_id)
    where(application_id: application_id)
  end

end
