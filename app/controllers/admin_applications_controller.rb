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
    if @app.all_approved == true
      @pets.all.update({
        adoptable: false
      })
    elsif @app.not_all_approved == true
      binding.pry
      @app.application_pets.update({
        status: false
      })
    end
  end

  def update
    @app = Application.find(params[:id])
    @app.update!({
      application_status: params[:application_status]
    })

    redirect_to admin_path
  end
end
