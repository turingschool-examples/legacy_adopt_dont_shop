class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  validates :name, :address, :city, :state, :zip, presence: true
  validates :description, presence: true, on: :update

  enum status: ['In Progress', 'Pending', 'Accepted', 'Rejected']
end
