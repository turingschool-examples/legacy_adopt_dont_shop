class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @search = Pet.where(name: params[:search_pets])
    # binding.pry
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.create(app_params)
    redirect_to"/applications/#{application.id}"
  end

  def add_pet
    @application = Application.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    ApplicationPet.create(application: @application, pet: @pet)
    redirect_to "/applications/#{@application.id}"
  end

  private
  def app_params
    params.permit(:name, :street_address, :city, :state, :zip, :description)
  end
end