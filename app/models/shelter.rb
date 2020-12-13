class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  scope :admin_shelter, -> {order('name DESC')}
  scope :pending_apps, -> {includes(pets: :applications).where(:applications => {:application_status => "Pending"})}

  def avg_pet_age
    adoptable = pets.where('adoptable = ?', true)
    adoptable.average(:approximate_age)
  end

  def pending_pets
    pending_pets = pets.joins(:applications).where('applications.application_status = ?', "Pending").select('applications.application_status AS pet_app_status, applications.id AS app_id, pets.*')
  end

  def count_adoptable
    adoptable = pets.where('adoptable = ?', true).count
  end

  def count_adopted
    adoptable = pets.where('adoptable = ?', false).count
  end
end
