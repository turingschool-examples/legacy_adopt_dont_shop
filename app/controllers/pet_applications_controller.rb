class PetApplicationsController < ApplicationController
  def create  
    binding.pry
    @pet_app = PetApplication.create(pet: pet_object, application: applicatin_object)
  end

end