class AdminApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets

    if params[:commit] == "Approve This Pet"
      @pet_approved = Pet.find(params[:pet_id])
      ApplicationPet.approve(@pet_approved.id, @application.id)
    end
    if params[:commit] == "Reject This Pet"
      @pet_approved = Pet.find(params[:pet_id])
      ApplicationPet.reject(@pet_approved.id, @application.id)
    end
  end
end
