class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.all.order('name DESC')
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
