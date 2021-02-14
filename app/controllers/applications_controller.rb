class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = 'Application could not be created, please fill in all fields!'
      redirect_to '/applications/new'
    end
  end

  def show
    @application = Application.find(params[:id])
    if params[:pet_name]
      @matching_pets = Pet.match(params[:pet_name])
    end
  end

  private
  def application_params
    # params.require(:exhibit)
    params.permit(:name, :address, :city, :state, :zip,) # :description
  end
end
