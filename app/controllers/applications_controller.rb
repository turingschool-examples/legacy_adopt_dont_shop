class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.new(application_params)
    application.save

    redirect_to "/applications/#{application.id}"
  end

  def show
    @application = Application.find(params[:id])
  end

  private
  def application_params
    # params.require(:exhibit)
    params.permit(:name, :address, :city, :state, :zip, :description)
  end
end
