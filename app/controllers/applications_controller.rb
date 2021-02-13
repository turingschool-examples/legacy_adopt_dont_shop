class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
    @pets = Pet.all
  end

  def show
    @application = Application.find(params[:id])
  end
end
