class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  validates_presence_of :pet_id, :application_id, :status
  enum status: [:"In Progress", :Pending, :Accepted, :Rejected]
end
