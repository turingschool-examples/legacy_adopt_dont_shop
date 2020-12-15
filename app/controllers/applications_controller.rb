class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_results = Pet.search(params[:search])
  end

  def new
  end

  def create
    application = Application.new(application_params)
    
    if application.save
      redirect_to applications_show_path(id: application.id)
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  private
  def application_params
    params.permit :name, :address, :city, :state, :zip_code, :status, :search
  end
end