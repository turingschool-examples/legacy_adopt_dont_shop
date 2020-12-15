class Application < ApplicationRecord
  has_many :application_pets
  has_many :pets, through: :application_pets

  validates :description, presence: true, on: :update

  def has_pets?
    !pets.empty?
  end

  def submitted?
    submitted
  end

  def formatted_address
    address + " " + city + ", " + state + " " + zip
  end

  def check_status
    if submitted?
      final_result = "Approved"
      pets.each do |pet|
        result = pet.application_result(id)
        if result == "Rejected"
          final_result = "Rejected"
          break
        elsif !result #no action has been taken
          final_result = "Pending"
          break
        end
      end
      final_result
    end
  end
end
