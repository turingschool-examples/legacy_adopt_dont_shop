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
      pet_name = Pet.find_by(name: search)
      if pet_name
        self.where(id: pet_name)
      else
        Pet.all
      end
    else
      Pet.all
    end
  end
end
