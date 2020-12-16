class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  def self.reverse_alphabetical
    find_by_sql('SELECT name FROM shelters ORDER BY name DESC')
  end

end
