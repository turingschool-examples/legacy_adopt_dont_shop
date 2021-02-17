class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    pet_application = PetApplication.find(params[:pet_application_id])
    pet_application.update(pet_appilcation_params)
  end

  private
  def pet_application_params
    params.permit(:application_status)
  end
end
