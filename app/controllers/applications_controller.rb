class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    if params[:pet_search]
      @pets = Pet.all.search_pet_by_name(params[:pet_search])
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to application_show_path(application.id)
    else
      flash.now[:notice] = "Error: Required information missing."
      render :new
    end
  end

  def update
    application = Application.find(params[:id])
    application.update(description: params[:description])
    redirect_to application_path(application.id)
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code)
  end
end
