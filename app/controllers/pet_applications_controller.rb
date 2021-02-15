class PetApplicationsController < ApplicationController
  def index
    @pet_applications = PetApplications.all
  end
end
