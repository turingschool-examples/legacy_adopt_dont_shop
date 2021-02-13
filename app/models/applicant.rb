class Applicant < ApplicationRecord
  has_many :pet_applicants
  has_many :pets, through: :pet_applicants

  enum status: [:in_progress, :pending, :accepted, :rejected]

  def full_address
    "#{address} #{city}, #{state} #{zip}"
  end
end
