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
    Application.create(applications_params)

    redirect_to "/applications"
  end

  private
  def applications_params
    params.permit(:applicant_name, :applicant_address, :city, :state, :zip, :description, :status)
  end
end
