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
      flash[:notice] = "Error: Required information missing."
      render :new
    end
  end


  private
  def applications_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end
