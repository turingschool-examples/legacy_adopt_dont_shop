class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.reverse_alphabetical
    find_by_sql('SELECT * FROM shelters ORDER BY name DESC')
  end

  def self.name_address(id)
    find_by_sql("SELECT * FROM shelters WHERE id=#{id}").first
  end

  def self.pending_applications
    joins(pets: [:application_pets, :applications])
    .where("applications.application_status = ?", "Pending")
    .distinct
    .order(:name)
  end

end
