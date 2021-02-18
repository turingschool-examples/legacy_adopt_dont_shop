class ApplicationPetsController < ApplicationController

  def create
    @application = Application.find(params[:application_id])
    @pet = Pet.find(params[:pet_id])
    @application_pet = ApplicationPet.new(application_pet_params)
    if @application_pet.save
      flash[:notice] = "Pet successfully added!"
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "Pet was not added!"
      redirect_to "/applications/#{@application.id}"
    end
  end

  def update

  end

  private
  def find_application
    @application = Application.find(params[:id])
  end

  def application_pet_params
    params.permit(:pet_id, :application_id)
  end


end
