class AdminApplicationsController < ApplicationController

  def show
    find_application
    # require "pry"; binding.pry
  end

  def update
    @application_pet = ApplicationPet.find(params[:application_pet_id])
    @application_pet.update(status: params[:status])
    @application = Application.find(params[:id])
    # @application.check_status
    @pet = Pet.find(params[:pet_id])

    redirect_to "/admin/applications/#{@application.id}"
  end


  private
  def find_application
    @application = Application.find(params[:id])
  end

end
