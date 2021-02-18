class PetApplicationsController < ApplicationController

  def create
      @pet_applications = PetApplication.new(application_id: params[:application_id], pet_id: params[:pet_id])
      @pet_applications.save
      redirect_to "/applications/#{params[:application_id]}"
  end

  def update
    @pet_application = PetApplication.find(params[:id])
    @application = Application.find(@pet_application.application_id)
    @pet = Pet.find(@pet_application.pet_id)
    @pet_application.update(status: "Approved")
    @pet.update(adoptable: false)
    redirect_to "/admin/applications/#{@application.id}"
  end
end
