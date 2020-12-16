class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.reverse_alphabetical
    find_by_sql('SELECT * FROM shelters ORDER BY name DESC')
  end

  def self.name_address(id)
    find_by_sql("SELECT id, name, address, city, state, zip FROM shelters WHERE id=#{id}").first
  end

end
