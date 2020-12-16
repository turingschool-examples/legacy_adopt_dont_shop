class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets, dependent: :destroy
  has_many :applications, through: :application_pets
  validates_presence_of :name, :description, :approximate_age, :sex
  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }
  enum sex: [:female, :male]
  
  def self.search_pet_by_name(pet_name)
    where("lower(name) like ?", "%#{pet_name.downcase}%").where(adoptable: true)
  end

  def self.make_adopted
    update_all(adoptable: false)
  end

  def self.avg_age
    average(:approximate_age)
  end

  def self.adoptable_count
    where(adoptable: true).count
  end

  def self.adopted_count
    where(adoptable: false).count
  end
end
