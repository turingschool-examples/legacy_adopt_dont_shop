class ApplicationPetsController < ApplicationController
  def create
    application_pet = ApplicationPet.new(application_id: params[:application_id], pet_id: params[:pet_id])
    if application_pet.save
    else
      flash[:notice] = "You've already added this pet."
    end
    redirect_to application_path(params[:application_id])
  end

  def update
    application = Application.find(params[:application_id])
    application_pet = ApplicationPet.where(application_id: params[:application_id], pet_id: params[:pet_id])
    approve_or_reject(application, application_pet, params[:status])
    redirect_to admin_application_path(application)
  end
end



private

def approval(application)
  if ApplicationPet.all_pets_approved?(application.id)
    application.update(application_status: "Approved")
    application.pets.make_adopted
  end
end

def rejection(application)
  if ApplicationPet.any_pets_rejected?(application.id)
    application.update(application_status: "Rejected")
  end
end

def approve_or_reject(application, application_pet, status)
  if params[:status] == "Approved"
    application_pet.update(status: "Approved")
    approval(application)
  elsif params[:status] == "Rejected" 
    application_pet.update(status: "Rejected")
    rejection(application)
  end
end