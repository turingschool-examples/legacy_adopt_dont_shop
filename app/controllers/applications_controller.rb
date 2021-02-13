class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
    @pet = Pet.find(params[:id])
  end

  def create
    @application = Application.create(app_params)
    @application.update(status: "In Progress")
    redirect_to "/applications/#{@application.id}"
  end

  private

  def app_params
    params.permit(:name, :street_address, :city, :state, :zipcode)
  end
end
