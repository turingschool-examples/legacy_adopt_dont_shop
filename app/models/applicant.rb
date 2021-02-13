class Applicant < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip

  has_many :pet_applicants
  has_many :pets, through: :pet_applicants

  enum status: ['In Progress', 'Pending', 'Accepted', 'Rejected']

  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end
end
