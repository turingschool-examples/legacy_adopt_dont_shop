class PetApplicationsController < ApplicationController
  def index
    # binding.pry
    @pet_application = PetApplication.all
  end

  def create

  end
end
