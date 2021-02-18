class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    if params[:search_pets] && params[:id]
      @matching_pets = Pet.search(params[:search_pets])
      @application = Application.find(params[:id])
    elsif params[:want_pet] && params[:id]
      @pet_application = PetApplication.create!(pet_id: params[:want_pet],application_id: params[:id])
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
      if @pet_application
        params[:pet_names] = [@pet_application.pet.name]
        # As the 'Adopt this pet' button is clicked, i must collect those names and add them to an array that will belong to the pet_names section of a newly created application that has not been submitted yet.

      end
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
