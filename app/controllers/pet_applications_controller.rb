class PetApplicationsController < ApplicationController

  def create
      @pet_applications = PetApplication.new(application_id: params[:application_id], pet_id: params[:pet_id])
      @pet_applications.save
      redirect_to "/applications/#{params[:application_id]}"
  end
end
