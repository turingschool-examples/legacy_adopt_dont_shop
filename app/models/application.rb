class Application < ApplicationRecord
  validates :name, :city, presence: true
  validates :state, length: {maximum: 2}, presence: true
  validates :zip_code, numericality: { only_integer: true }, presence: true
  has_many :application_pets
  has_many :pets, through: :application_pets

  def chosen_ones
    pets
  end
end
