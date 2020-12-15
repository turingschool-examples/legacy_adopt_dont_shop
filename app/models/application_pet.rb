class ApplicationPet < ApplicationRecord
  scope :is_approved, -> { where('status = ?', "Approved") }
  scope :is_rejected, -> { where('status = ?', "Rejected") }
  scope :find_applications, -> (application_id) { where(application_id: application_id) }

  belongs_to :application
  belongs_to :pet
  validates_presence_of :status, :application_id, :pet_id
  validates :pet_id, uniqueness: { scope: :application_id }

  def self.all_pets_approved?(application_id)
    find_applications(application_id).is_approved
    .count == find_applications(application_id).count
  end

  def self.any_pets_rejected?(application_id)
    find_applications(application_id).is_rejected
    .count >= 1
  end

end