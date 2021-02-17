class ApplicationPetsController < ApplicationController

  def index
    @application_pet = ApplicationPet.all
  end

  def new

  end

  def create
    application = Application.find(params[:application_id])
    pet = Pet.where(name: params[:search])
    application_pet = ApplicationPet.create!(application_id: application.id, pet_id: pet.first.id)
    redirect_to "/applications/#{application.id}"
  end
end
