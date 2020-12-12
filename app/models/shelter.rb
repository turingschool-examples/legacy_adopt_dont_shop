class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :applications, dependent: :nullify
  scope :admin_shelter, -> {order('name DESC')}
  # scope :admin_pending_shelters, -> {order('name ASC'), where('applications.application_status =?', "Pending")}


  def avg_pet_age
    adoptable = pets.where('adoptable = ?', true)
    adoptable.average(:approximate_age)
  end

  def pending_pets
    pending = pets.each {|pet| pet.pending_applications}
    binding.pry
  end

  def count_adoptable
    adoptable = pets.where('adoptable = ?', true).count
  end

  def count_adopted
    adoptable = pets.where('adoptable = ?', false).count
  end
end
