class ApplicationsController < ApplicationController
  # def index
  #   @applications = Application.all
  # end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    Application.create(application_params)
    redirect_to '/applications/:id/show'
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
