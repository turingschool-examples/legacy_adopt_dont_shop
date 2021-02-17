class AdminsController < ApplicationController
  def show 
    @application = Application.find(params[:id])
  end

  def updatePetApp
    @application = Application.find(params[:id])
    @application.change_pet_status(params[:commit], params[:pet_id], params[:id])
    @application.change_status(params[:id])
    Pet.change_adopt_status(params[:id])
    redirect_to "/admin/applications/#{params[:id]}"
  end
end