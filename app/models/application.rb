class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates_presence_of :name, :address, :city, :state, :zip
  validates_length_of :name, {minimum: 3, maximum: 50}
  validates_length_of :address, {minimum: 3, maximum: 50}
  validates_length_of :city, {minimum: 3, maximum: 50}
  validates_length_of :state, {minimum: 2, maximum: 2}
  validates_length_of :zip, {minimum: 5, maximum: 5}

  def approved?
    status == "Approved"
  end
end
