class PetApplicationsController < ApplicationController
  def index
    @pet_application = PetApplication.all
  end

  # def show
  #   Pet.where("name like ?", "%#{params[:search_pets]}%")
  # end
end
