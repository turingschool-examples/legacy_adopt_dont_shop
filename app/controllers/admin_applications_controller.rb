class AdminApplicationsController < ApplicationController

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
      @app.update!({application_status: "Approved"})
    elsif @app.not_all_approved == true
      @app.application_pets.update({
        status: false
      })
      @app.update!({application_status: "Rejected"})
    end
  end
end
