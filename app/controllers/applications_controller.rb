class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    application = Application.new(app_params)
    application.save
    # require 'pry'; binding.pry
    redirect_to "/applications/#{application.id}"
    # if 
    #   application = pet.applications.create(app_params)
    #   application[:status] = "In Progress"
    #   application.save
    #   redirect_to "/applications/#{application.id}"
    # else
    #   flash[:notice] = "Please complete all fields."
    #   redirect_to "/applications/new"
    # end
  end

  private

  def app_params
    params.permit(:status, :name, :street, :city, :state, :zip, :description)
  end
end