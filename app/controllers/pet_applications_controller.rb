class PetApplicationsController < ApplicationController
  def index
    @pet_application = PetApplication.all
  end

  # def create
  #   @application = Application.find(params[:id])
  #   @pet = Pet.find(params[:id])
  #   @pet_applications = PetApplication.create!(pet: @pet, application: @application)
  #   redirect_to "/applications/#{@application.id}"
  # end
end
