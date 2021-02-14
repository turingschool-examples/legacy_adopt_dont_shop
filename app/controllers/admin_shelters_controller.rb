class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_alpha
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
