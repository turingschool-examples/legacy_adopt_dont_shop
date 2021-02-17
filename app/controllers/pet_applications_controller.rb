class PetApplicationSController < ApplicationController
  def index
    @pet_applications = PetApplication.all
  end


  def create
    @application = Application.find(params[:application_id])
    @application.update(application_status: "Pending")
    ApplicationPet.create(application_id: params[:application_id],
                            pet_id: params[:pet_id])
    redirect_to application_path(params[:application_id])
  end
end
