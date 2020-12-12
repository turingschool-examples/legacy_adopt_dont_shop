class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    Application.create(application_params)
    redirect_to applications_path
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :description)
  end
end