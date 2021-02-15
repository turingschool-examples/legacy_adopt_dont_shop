class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
    @pets = Pet.all
  end

  def show
    if params[:search]
      @pets = Pet.search(pet_search)
      @application = Application.find(params[:id])
    else
      @application = Application.find(params[:id])
    end
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    @application.application_status = "In Progress"
      if @application.save
        redirect_to "/applications/#{@application.id}"
      else
        flash[:error] = "Application not Accepted: Missing Required Information"
        redirect_to '/applications/new'
    end
  end


  private
  def application_params
    params.require(:application).permit(:name, :street, :city, :state, :zip_code, :description)
  end

  def pet_search
    params.permit(:search)
  end
end
