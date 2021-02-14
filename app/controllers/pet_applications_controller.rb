class PetApplicationsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    app = Application.find(params[:app_id])
    app.pets << pet

    redirect_to "/applications/#{params[:app_id]}"
  end
end
