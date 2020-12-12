class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to application_path(application.id)
      flash[:success] = nil
    else 
      flash[:failure] = "Application not created: Required information missing or invalid."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip_code)
  end
end