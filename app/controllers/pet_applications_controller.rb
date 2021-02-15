class PetApplicationsController < ApplicationController
  
  def create  
    @pet_app = PetApplication.create(pet_id: params[:pet_id].to_i, application_id: params[:application_id].to_i)
    redirect_to  "/applications/#{params[:application_id].to_i}"
  end

end
