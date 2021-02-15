class ApplicationsController < ApplicationController
  def new 
  end

  def create
    @application = Application.create(application_params)
    redirect_to  "/applications/#{@application.id}" 
  end

  def show 
    @application = Application.find(params[:id])
    @pets = @application.match_pets(params[:pet_name])
    @pet_apps = @application.pets_on_app(params[:id])
  end

  def submit 
    @application = Application.find(params[:id])
    @application.update(description: params[:description], status: "Pending")
    redirect_to  "/applications/#{params[:id]}"
  end

  private 
  def application_params 
    params.permit(:name, :street, :city, :state, :zip)
  end
end
