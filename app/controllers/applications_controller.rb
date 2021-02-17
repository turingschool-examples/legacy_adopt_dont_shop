class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    if params[:search_pets] && params[:id]
      @matching_pets = Pet.search(params[:search_pets])
      @application = Application.find(params[:id])
      ### This part seems to be working fine
    elsif params[:want_pet] && params[:id]
      @pet_application = PetApplication.create!(pet_id: params[:want_pet],application_id: params[:id])
      ### check the view!
      @application = Application.find(params[:id])
    else
      @application = Application.find(params[:id])
    end
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash.now[:alert] = "Form must be completed in order to submit the application. Please complete every field in the form."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip, :description, :status)
  end
end
