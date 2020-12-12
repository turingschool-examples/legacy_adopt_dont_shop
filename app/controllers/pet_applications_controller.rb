class PetApplicationsController < ActionController::Base

  def index
    @pet_applications = PetApplications.all
  end
end