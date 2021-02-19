class PetApplicationsController < ApplicationController
  def index
    @pet_application = PetApplication.all
  end

  def new
    @pet_application = PetApplication.new
  end
end
