class AdminApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @app = Application.find(params[:id])
    @pets = @app.pet_apps(params[:id])
    if params[:commit]
      @app_pet = ApplicationPet.find(params[:pet_app_id])
      @app_pet.update({
        status: params[:status]
      })
    end
  end
end
