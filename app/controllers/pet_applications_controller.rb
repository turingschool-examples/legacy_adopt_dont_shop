class PetApplicationsController < ApplicationController
  def index
    @pet_application = PetApplication.all
  end
end
