class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.reverse_alphabetical
    find_by_sql('SELECT * FROM shelters ORDER BY name DESC')
  end

  def self.name_address(id)
    find_by_sql("SELECT * FROM shelters WHERE id=#{id}").first
  end

  def pending_applications
    pets.select("pets.name, applications.id")
    .joins(application_pets: [:application])
    .where("applications.application_status = ?", "Pending")
    .where("application_pets.status =?", "Pending")
  end

end
