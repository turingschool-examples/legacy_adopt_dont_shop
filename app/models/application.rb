class Application < ApplicationRecord
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets

  validates_presence_of :name
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip_code
  validates :zip_code, zipcode: { country_code: :us }
  validates_presence_of :description, on: :update

  

  def in_progress?
    self.application_status == "In Progress"
  end

  def pending?
    self.application_status == "Pending"
  end

  def approved?
    self.application_status == "Approved"
  end

  def rejected?
    self.application_status == "Rejected"
  end

  def has_pets_selected?
    self.pets.count >= 1
  end

  def pet_status(pet_id)
    application_pets.find_by(pet_id: pet_id).status
  end

end
