class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_app_hash = @application.pets.each_with_object({}) do |pet, hash|
      hash[pet.name] = PetApplication.find_by(pet_id: pet.id, application_id: @application.id)
    end
  end
end
