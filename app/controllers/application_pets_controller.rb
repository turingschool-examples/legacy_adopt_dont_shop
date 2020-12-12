class ApplicationPetsController < ApplicationController
  def create
    pet = Pet.find(params[:pet])
    application = Application.find(params[:id])
    ApplicationPet.create(pet: pet, application: application)
    redirect_to application_path(application)
  end
end
