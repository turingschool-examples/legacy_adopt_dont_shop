class UserApplication < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications
  validates_presence_of :name, :city
  validates_presence_of :state, length: {maximum: 2}
  validates_presence_of :zip, numericality: { only_integer: true }
  enum status: ['In Progress', 'Pending', 'Approved', 'Rejected']

  def pet_name
    pets.pluck(:name)
  end
end
