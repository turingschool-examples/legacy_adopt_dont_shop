class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    application = Application.create(
      name: params[:post][:name],
      street_address: params[:post][:street_address],
      city: params[:post][:city],
      state: params[:post][:state],
      zip: params[:post][:zip],
      description: params[:post][:description]
    )
    redirect_to"/applications/#{application.id}"
  end
end