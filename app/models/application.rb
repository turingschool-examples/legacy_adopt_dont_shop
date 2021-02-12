class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates_presence_of :first_name, :last_name

  validates :zipcode, numericality: {
              greater_than_or_equal_to: 0
            }

  enum status: [:in_progress, :pending, :accepted, :rejected]

  def capitalized_status
    string_status = status.capitalize
    if status == "in_progress"
      string_status = "In Progress"
    end
  end
end
