class ApplicationsController < ApplicationController
# require "pry"; binding.pry

  def show
    find_application
    if params[:pet_search]
      @pets = Pet.sort(params[:pet_search])
    end
  end

  def index
    @applications = Application.all
  end

  def new

  end

  def create
    if params[:status].nil?
      params[:status] = "In Progress"
    end
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = "Appplication successfully saved!"
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "You're missing vital information!"
      render 'new'
    end
  end

  def update
    find_application
    if @application.update(application_params)
      flash[:notice] = "Appplication successfully submitted!"
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "You're missing vital information!"
      render 'new'
    end
  end

  private

  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.permit(:name, :address, :description, :status, :submit)
  end
end
