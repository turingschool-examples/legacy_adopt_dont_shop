class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical
  end

  def show
    @shelter = Shelter.name_address(params[:id])
  end
end