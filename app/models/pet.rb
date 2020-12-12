class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :applicant_pets
  has_many :applicants, through: :applicant_pets

  validates_presence_of :name, :description, :approximate_age, :sex
  # ^ AR method to validate presence of column
  # note image and adopable is not validated
  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }
  # ^ AR method to validate attribute has numeric value
  enum sex: [:female, :male]
  # ^ AR method to limit to specific enumeration (options)

end
