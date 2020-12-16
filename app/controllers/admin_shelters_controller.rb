class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical
    @pending_shelters = Shelter.pending_applications
  end

  def show
    @shelter = Shelter.name_address(params[:id])
  end
end