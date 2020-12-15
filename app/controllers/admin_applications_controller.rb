class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def review
    application_pet = ApplicationPet.where(pet_id: params[:pet_id],application_id: params[:id])
    application_pet.status = params[:action]
    application_pet.save
    redirect("/admin/applications/#{params[:id]}")
  end
end
