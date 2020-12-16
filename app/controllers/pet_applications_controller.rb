class PetApplicationsController < ApplicationController
  def create
    @application = Application.find(params[:application_id])
    @apps_pet = PetApplication.new(application_id: @application.id, pet_id: params[:pet_id])

    if @apps_pet.valid?
      @apps_pet.save
    redirect_to "/applications/#{@application.id}"
    end
  end
end
