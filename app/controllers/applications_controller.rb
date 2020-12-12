class ApplicationsController < ApplicationController
  def new
  end

  def create
    application = Application.create!(application_params)
    redirect_to application_path(application)
  end

  def show
    @application = Application.find(params[:id])
  end

  private
  def application_params
    params[:application].permit(:applicant_name, :street_address, :city, :state, :zip)
  end
end
