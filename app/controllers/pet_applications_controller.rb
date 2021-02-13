class PetApplicationsController < ActionController

  def index
    @pet_applications = PetApplications.all
  end
end
