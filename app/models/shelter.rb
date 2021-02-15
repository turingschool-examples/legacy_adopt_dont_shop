class Shelter < ApplicationRecord
  has_many :pets

  def self.sort_alpha
    order(:name).reverse
  end
end
