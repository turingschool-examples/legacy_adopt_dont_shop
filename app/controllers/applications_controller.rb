class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    if params[:search_pets] #it's finding the pet...
      @matching_pets = Pet.search(params[:search_pets]) # try on live server now.
      # binding.pry
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
      render :new #changed to this line and added .now above from lesson today 2/16.
    end
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip, :description, :status)
  end
end
