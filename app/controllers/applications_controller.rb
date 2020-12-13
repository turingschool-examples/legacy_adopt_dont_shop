class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
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
    params.permit(:name)
    params.permit(:address)
    params.permit(:city)
    params.permit(:state)
    params.permit(:zip_code)
    params.permit(:status)
  end
end