class Shelter < ApplicationRecord
  has_many :pets

  def formatted_address
    address + " " + city + ", " + state + " " + zip.to_s
  end

  def avg_age
    a = pets.where("adoptable = 'true'").average(:approximate_age)
    a
  end

  def self.pending_shelters
    joins(pets: :application_pets).where("status IS NULL")
  end
end
