class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zip, :description, :status
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.search(search)
    if search
      adoptable = Pet.find_by(name: search)
      if adoptable
        self.where(pet_id: adoptable)
      else
        @applications = Application.all
      end
    else
      @application = Application.all
    end
  end
end
