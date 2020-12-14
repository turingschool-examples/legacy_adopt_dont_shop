class ApplicationsController < ApplicationController
  def new
  end

  def create
    @app = Application.new(application_params)
    if @app.save
      redirect_to application_path(@app.id)
    else
      flash[:notice] = "Application not created: Required information missing."
      render :new
    end
  end

  def show
    @app = Application.find(params[:id])
    @pets = Pet.adoptable
    @chosen_ones = @app.pets
    if params[:search]
      @selected = Pet.search_pets(params[:search])
    end
    if params[:adopt] && params[:pet_id]
      pet = Pet.find(params[:pet_id])
      ApplicationPet.create!(pet: pet, application: @app)
    end
  end

  def update
    app = Application.find(params[:id])
    app.update!(application_params)
    redirect_to application_path(app.id)
  end

  private

  def application_params
    params.permit(:name, :street, :city, :state, :zip_code, :description, :application_status)
  end
end
