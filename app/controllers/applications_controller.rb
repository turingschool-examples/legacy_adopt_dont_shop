class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new

  end

  def create
    @application = Application.create!({
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      description: params[:description]
      })
    redirect_to "/applications/#{@application.id}"
  end
  # def index
  #
  # end
end
