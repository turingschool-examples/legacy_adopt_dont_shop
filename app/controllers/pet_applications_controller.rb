class PetApplicationsController < ApplicationController
  def create
    pet = Pet.find(params[:pet_id])
    app = Application.find(params[:app_id])
    app.pets << pet

    redirect_to "/applications/#{params[:app_id]}"
  end

  def update
    pet_app = PetApplication.where(pet_id: params[:pet_id], application_id: params[:app_id]).first
    if params[:update_type] == 'approve'
      pet_app.update(status: 1)
    elsif params[:update_type] == 'reject'
      pet_app.update(status: 2)
    end

    redirect_to "/admin/applications/#{params[:app_id]}"
  end
end
