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
    application = Application.new(applications_params)

    if application.save
      redirect_to "/applications"
    else
      flash[:notice] = "A field cannot be empty"
      render :new
    end
  end

  private
  def applications_params
    params.permit(:applicant_name, :applicant_address, :city, :state, :zip, :description, :status)
  end
end
