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
    application = Application.new(app_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else 
      flash[:notice] = "Please Complete All Fields"
      render :new 
    end 
  end

  private

  def app_params
    params.permit(:status, :name, :street, :city, :state, :zip, :description)
  end
end