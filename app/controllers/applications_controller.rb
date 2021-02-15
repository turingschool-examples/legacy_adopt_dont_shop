class ApplicationsController < ApplicationController
# require "pry"; binding.pry

  def show
    find_application
    if params[:pet_search]
      @pets = Pet.sort(params[:pet_search])
    end
    if params[:pet_id]
      @application.add_pet(params[:pet_id])
    end
    if params[:submit] && !params[:description]
      flash[:notice] = "Missing vital information!"
    elsif params[:submit] && params[:description]
      @application.submit
      @application.add_description(params[:description])
      flash[:notice] = "Appplication successfully submitted!"
    else
    end
  end

  def index
    @applications = Application.all
  end

  def new

  end

  def create
    # require "pry"; binding.pry
    if params[:status].nil?
      params[:status] = "In Progress"
    end
    @application = Application.new(application_params)
    if @application.save
      flash[:notice] = "Appplication successfully saved!"
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "You're missing vital information!"
      redirect_to "/applications/new"
    end
  end

  private

  def find_application
    @application = Application.find(params[:id])
  end

  def application_params
    params.permit(:name, :address, :description, :status)
  end
end
