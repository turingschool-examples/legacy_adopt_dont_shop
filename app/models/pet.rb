class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.search_pets(search)
    if search
      if search == ""
        Pet.all
      else
        formatted_search = search.downcase.capitalize
        results = Pet.all.select{ |pet| pet.name == formatted_search }
        if results.empty?
          nil
          # self.where(id: results)
        else
          results
        end
      end
    else
      Pet.all
    end
  end
end
