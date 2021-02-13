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
    application = Application.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      street_address: params[:street_address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      status: "Pending",
    })

    application.save

    redirect_to "/applications/#{application.id}"
  end
end
