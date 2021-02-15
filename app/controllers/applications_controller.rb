class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def new
  end

  def create
    application = Application.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: "",
      status: "Pending",
    })

    application.save

    id = application.id

    redirect_to "/applications/#{id}"
  end
end
