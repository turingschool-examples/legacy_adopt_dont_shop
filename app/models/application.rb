class Application < ApplicationRecord 
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  
  after_initialize :default, unless: :persisted?

  def default 
    self.status = "In Progress"
    self.description = "Please enter description"
  end

  def match_pets(name)
      Pet.where("lower(name) LIKE ?", "%#{name.downcase}%")
  end

  def pets_on_app(id)
    pets_apps = PetApplication.where("application_id = #{id}")
    pets = pets_apps.map{|pet| Pet.find(pet.pet_id)}
  end 
end