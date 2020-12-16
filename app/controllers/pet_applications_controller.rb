class PetApplicationsController < ApplicationController
  def create
    PetApplication.create(application_id: :application_id, pet_id: :pet_id)
    redirect_to "/applications/#{params[:application_id]}"
  end

end