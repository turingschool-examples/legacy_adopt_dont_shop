class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    @application = Application.find(params[:id])
    @shelter = Shelter.find(params[:shelter_id])
  end
end
