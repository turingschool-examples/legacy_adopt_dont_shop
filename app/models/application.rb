class Application < ApplicationRecord
  validates :name, :city, presence: true
  validates :state, length: {maximum: 2}, presence: true
  validates :zip_code, numericality: { only_integer: true }, presence: true
  belongs_to :shelter
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets

  def chosen_ones
    pets
  end

  def pet_apps(app_id)
    @pets = Pet.select('application_pets.id AS pet_app_id, pets.*, application_pets.status').joins(:application_pets).where('application_pets.application_id = ?', app_id)
  end
end
