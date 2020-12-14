class UserApplication < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications
  validates :name, :city, presence: true
  validates :state, length: {maximum: 2}, presence: true
  validates :zip, numericality: { only_integer: true }, presence: true


  def pet_app(app_id)
    @pets = Pet.select('application_pets.id AS pet_app_id, pets.*, application_pets.status')
    .joins(:application_pets)
    .where('application_pets.application_id = ?', app_id)
  end
end
