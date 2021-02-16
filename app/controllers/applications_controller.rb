class ApplicationsController < ApplicationController

  def new
  end

  def show
    @application = Application.find(params[:id])
    @pets = Pet.search(params[:search])

  end

  def create
    @application = Application.create(application_params)
    @application.update(status: "In Progress")
    if !@application.save
      flash[:notice] = "Your application was not saved. Please fill in all application fields."
      redirect_to '/applications/new'
    else @application.save
      redirect_to "/applications/#{@application.id}"
    end
  end

  def update
    @application = Application.find(params[:id])
    @application.update({
      description: params[:description],
      status: "Pending"})

    redirect_to "/applications/#{@application.id}"
  end

  private
  def application_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
