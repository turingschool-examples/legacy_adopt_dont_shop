class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :address, presence: true, length: {minimum: 3, maximum: 50}
  validates :city, presence: true, length: {minimum: 3, maximum: 50}
  validates :state, presence: true, length: {minimum: 2, maximum: 2}
  validates :zip, presence: true, :numericality => { :length => 5 }
  validates :description, presence: true, length: {minimum: 3, maximum: 50}
end
