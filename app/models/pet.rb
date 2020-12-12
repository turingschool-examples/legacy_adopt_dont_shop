class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :application_pets, dependent: :destroy
  has_many :applications, through: :application_pets
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }
  enum sex: [:female, :male]
  scope :adoptable, -> { where('adoptable = true')}
  scope :pending_apps, -> { joins(:applications).select('applications.*').where('applications.application_status = ?', "Pending")}

  def pending_applications
    joins(:applications).select('applications.*').where('applications.application_status = ?', "Pending")
  end


  def self.search_pets(find)
    # binding.pry
    key = "%#{find}%".downcase
    where("LOWER(name) like :search", search: key)
  end
end
