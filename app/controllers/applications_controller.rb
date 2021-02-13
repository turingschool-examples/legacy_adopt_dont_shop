class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
    @shelter = Shelter.find(params[:shelter_id])
  end

  def show
    binding.pry
    @application = Application(params[:id])
  end
end
