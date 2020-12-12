class AdminApplicationsController < ApplicationController

  def index
    @applications = Application.where('application_status <> ?', "In Progress")
  end

  def show
    @app = Application.find(params[:id])
    @pets = @app.pet_apps(params[:id])
    if params[:commit]
      app_pet = ApplicationPet.find(params[:pet_app_id])
      app_pet.update({
        status: params[:status]
      })
    end
    if params[:application_status] == "Approved!"
      @pets.all.update({
        adoptable: false
      })
    end
  end
end
