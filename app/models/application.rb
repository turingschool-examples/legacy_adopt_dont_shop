class Application < ApplicationRecord

  has_many :application_pets
  has_many :pets, through: :application_pets

  validates_presence_of :name
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates :zip_code, zipcode: { country_code: :us }

  def in_progress?
    self.application_status == "In Progress"
  end

  def pending?
    self.application_status == "Pending"
  end

  def accepted?
    self.application_status == "Accepted"
  end

  def rejected?
    self.application_status == "Rejected"
  end
end
