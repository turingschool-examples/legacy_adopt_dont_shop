class AdminApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def update
    application_pet = ApplicationPet.find(params[:ap_id])
    application_pet.update(pets_params)

    redirect_to "/admin/applications/#{params[:id]}"
  end

  private

  def pets_params
    params.permit(:status)
  end
end
