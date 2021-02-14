class Application < ApplicationRecord 
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  
  after_initialize :default, unless: :persisted?

  def default 
    self.status = "In Progress"
    self.description = "Please enter description"
  end

  def match_pets(name)
      Pet.where("name LIKE ?", "%#{name}%")
  end
end