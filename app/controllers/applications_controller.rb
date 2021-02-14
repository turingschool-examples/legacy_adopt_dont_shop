class ApplicationsController < ApplicationController
  def new 
  end

  def create
    @application = Application.new(application_params)
    @application.status = "In Progress"
    @application.save
    redirect_to  "/applications/#{@application.id}"
  end

  def show 
    @application = Application.find(params[:id])
    @pets = @application.match_pets(params[:pet_name])
  end

  private 
  def application_params 
    params.permit(:name, :street, :city, :state, :zip)
  end
end
