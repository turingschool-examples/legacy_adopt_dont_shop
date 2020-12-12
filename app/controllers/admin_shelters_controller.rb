class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.admin_shelter
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pending_pets = @shelter.pending_pets
  end
end
