class ApplicationPetsController < ApplicationController
  def create
    ApplicationPet.create(application_id: params[:application_id],
                            pet_id: params[:pet_id])
    redirect_to application_path(params[:application_id])
  end

  def update
    application = Application.find(params[:application_id])
    application_pet = ApplicationPet.where(application_id: params[:application_id], pet_id: params[:pet_id])
    if params[:status] == "Approved"
      application_pet.update(status: "Approved")
      if ApplicationPet.all_pets_approved?(application.id)
        application.update(application_status: "Approved")
      end
    elsif params[:status] == "Rejected" 
      application_pet.update(status: "Rejected")
      application.update(application_status: "Rejected")
    end
    redirect_to admin_application_path(application)
  end
end
