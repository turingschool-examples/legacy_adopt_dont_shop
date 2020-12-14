class ApplicationPetsController < ApplicationController
  def index
    @pets = ApplicationPet.find_by_name(params[:search])
  end
end
