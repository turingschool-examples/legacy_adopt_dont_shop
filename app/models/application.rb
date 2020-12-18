class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zip, :description, :status
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def in_progress?
    self.status == "In Progress"
  end

  def pending?
    self.status == "Pending"
  end

  def accepted?
    self.status == "Accepted"
  end

  def rejected?
    self.status == "Rejected"
  end
end
