class UserApplicationsController < ApplicationController
  def show
    @pets = Pet.all #change to adoptable pets?
    @app = UserApplication.find(params[:id])
    @picked_pets = @app.pets

    if params[:search]
      @picked = UserApplication.find_pets(params[:search][:name])
    else
      @found_pets = []
    end
  end

  def new
  end

  def create
    app = UserApplication.create(app_params)
    if app.save
      redirect_to "/applications/#{app.id}"
    else
      flash[:notice] = "Please Fill in all Required Fields"
      render :new
    end
  end

  private
  def app_params
    params.permit(:name, :address, :city, :state, :zip, :description)
  end
end