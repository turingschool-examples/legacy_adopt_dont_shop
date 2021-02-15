class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets

  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.search(search_terms)
    if search_terms
      @pets = Pet.find_by(name: search_terms)
    else
      @pets = Pet.all
    end
  end
end
