class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state,presence: true
  validates :zip_code, presence: true
  validates :status, presence: true

  def check_status_for_add_pets
    if status == 'In Progress'
      "show"
      
    end
    
  end
end