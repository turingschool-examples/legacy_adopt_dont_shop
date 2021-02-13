class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
    @pets = Pet.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.new(application_params)
    application.application_status = "In Progress"
    application.save
    redirect_to "/applications/#{application.id}"
  end

  private
  def application_params
    params.require(:application).permit(:name, :street, :city, :state, :zip_code, :description)
  end
end
