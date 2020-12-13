class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }
  enum sex: [:female, :male]

  def self.search(search)
    if search
      wanted_pet = Pet.find_by(name: search)
        if wanted_pet
          self.where(pet_id: wanted_pet)
        else
          @pets = Pet.all
        end
    else
      @pets = Pet.all
    end
  end
end
