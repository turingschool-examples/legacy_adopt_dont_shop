class ApplicationsController < ApplicationController

  def show
    if params[:submitted]
      @application = Application.find(params[:id])
      @application.status = "Pending"
      @application.save
    elsif params[:search]
      @application = Application.find(params[:id])
      @pets = Application.find_pet(params[:search])
      # possible move to model
    else
      @application = Application.find(params[:id])
    end
  end

  def new
  end

  def create
    @application = Application.new(application_params)
    @application.status = "In Progress"
    @application.save
    if @application.id
      redirect_to "/applications/#{@application.id}"
    else
      flash[:notice] = "Whoops! Fill in that which you have forgotten."
      render :new
    end
  end

  private
  def application_params
    params.permit(:name, :street, :city, :state, :zip, :description, :status, :pets)
  end
end
