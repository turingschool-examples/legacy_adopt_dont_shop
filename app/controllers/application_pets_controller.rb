class ApplicationPetsController < ApplicationController

  def new
    @application = Application.find(params[:app_id])
    @pet = Pet.find(params[:pet_id])

    ApplicationPet.create!(pet: @pet, application: @application)
    redirect_to "/applications/#{@application.id}"
  end

  private
  def application_pets_params
    params.permit(:app_id, :pet_id)
  end

end
