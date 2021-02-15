class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @pet_app = @application.pets
    if params[:commit]
      @selected = Pet.find(params[:search])
    end
    if params[:adopt]
      chosen = Pet.find(params[:pet_id])
      pet_appllication = PetApplication.create!(pet_id: selected.id, application_id: @application.id)
    end
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to applications_show_path(application.id)
    else
      flash[:notice] = "Error: Required information missing."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end
