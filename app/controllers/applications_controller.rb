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

  # def search
  #   @pet_results = @pet_results = Pet.search(params[:search])
    
  # end

  private
  def application_params
    params.permit(:name)
    params.permit(:address)
    params.permit(:city)
    params.permit(:state)
    params.permit(:zip_code)
    params.permit(:status)
    params.permit(:search)
  end
end