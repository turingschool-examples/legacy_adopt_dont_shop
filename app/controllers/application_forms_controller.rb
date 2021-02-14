class ApplicationFormsController < ApplicationController
  def index
    @applications = ApplicationForm.all
  end

  def show
    @application = ApplicationForm.find(params[:id])
  end

  def new
  end

  def create
    ApplicationForm.create(application_params)
    redirect_to '/applications'
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :reviewed, :accepted, :created_at, :updated_at)
  end
end
